# == Schema Information
#
# Table name: companies
#
#  id              :integer          not null, primary key
#  name            :string
#  shark_policy    :boolean
#  iuu_list        :boolean
#  code_of_conduct :boolean
#  member          :boolean
#  avatar          :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  code            :string
#  draft_id        :integer
#  published_at    :datetime
#  trashed_at      :datetime
#

class Company < ApplicationRecord
  has_paper_trail
  #has_drafts
  include HasBaitRatio

  has_many :documents, as: :documentable
  has_many :vessels
  has_many :fisheries, through: :vessels
  has_many :unloadings, through: :vessels
  has_many :unloading_catches, through: :unloadings
  has_many :fishes, through: :unloading_catches
  has_many :bait_loadings, through: :vessels
  has_many :carier_loadings, through: :vessels
  has_many :users, through: :company_positions
  has_many :company_positions
  has_and_belongs_to_many :member_fisheries,
    class_name: "Fishery",
    join_table: "fisheries_companies",
    uniq: true

  scope :default,       -> { order('companies.name ASC') }
  scope :harvest,       -> { where( harvest: true ) }
  scope :processing,    -> { where( processing: true ) }
  scope :unknown_type,  -> { where.not( harvest: true, processing: true ) }

  validate :avatar_size
  validates :name,
  	presence: true


  mount_uploader :avatar, AvatarUploader

  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h, :fishery_id
  after_update :crop_avatar

  def crop_avatar
    avatar.recreate_versions! if crop_x.present?
  end

  def has_fishing_vessels?
    vessels.where(vessel_type_id: VesselType.find_by(code: 'pol')).any? || vessels.where(vessel_type_id: VesselType.find_by(code: 'hl')).any?
  end

  def has_carrier_vessels?
    vessels.where(vessel_type_id: VesselType.find_by(code: 'ca')).any?
  end

  def initials
    if code.present?
      code.capitalize
    else
      "#{self.name.split.last.first.capitalize}#{self.name.split.last.first.capitalize}"
    end
  end

  def bait_fishes
    bait = []
    member_fisheries.each do |fishery|
      bait << fishery.bait_fishes
    end
    bait.first.uniq.sort_by(&:code)
  end

  def current_catch_composition_chart
    Rails.cache.fetch(["current_catch_composition_chart", self], expires_in: 60.minutes) do
      unloadings  = self.unloadings.where( 'unloadings.time_in > ?', Date.today.beginning_of_year)
      catches     = UnloadingCatch.where(unloading_id: unloadings.map(&:id) ).group(:fish_id).sum(:quantity)
      catches     = Hash[catches.map{|k,v| [Fish.find(k).code,v]}]
    end
  end

  def average_catch_composition_chart
    Rails.cache.fetch(["average_catch_composition_chart", self], expires_in: 60.minutes) do
      unloadings  = self.unloadings
      catches     = UnloadingCatch.where(unloading_id: unloadings.map(&:id) ).group(:fish_id).sum(:quantity)
      catches     = Hash[catches.map{|k,v| [Fish.find(k).code,v]}]
    end
  end

  def current_monthly_production_chart
    Rails.cache.fetch(["current_monthly_production", self], expires_in: 60.minutes) do
      fishes   = self.fishes.default.uniq
      production = fishes.map{ |fish|
        {
          name: fish.code,
          data: Unloading.
            includes(:unloading_catches).
            where(
              'unloadings.vessel_id IN (?) AND unloading_catches.fish_id = ?',
              self.vessels.map(&:id),
              fish.id
            ).
            where( time_in: Date.today.beginning_of_year..Date.today ).
            group_by_month_of_year(:time_in, format: '%b' ).
            sum('unloading_catches.quantity')
        }
      }
      #production.delete_if { |k, v| v.blank? }
    end
  end

  def average_monthly_production_chart
    Rails.cache.fetch(["average_monthly_production", self], expires_in: 60.minutes) do
      fishes      = self.fishes.default.uniq
      production  = fishes.map{ |fish|
        {
          name: fish.code,
          data: Unloading.
            includes(:unloading_catches).
            where(
              'unloadings.vessel_id IN (?) AND unloading_catches.fish_id = ?',
              self.vessels.map(&:id),
              fish.id
            ).
            group_by_month_of_year(:time_in, format: '%b' ).
            sum('unloading_catches.quantity')
        }
      }

      newest    = self.unloadings.default.first.time_in.end_of_year
      oldest    = self.unloadings.default.last.time_in.end_of_year - 1.year
      timespan  = newest.year - oldest.year


      production.each do |p|
        p[:data].update( p[:data] ) { |k,v| v / timespan }
      end
      production
      #production.delete_if { |k, v| v.blank? }
    end
  end


  private

  def avatar_size
    errors[:avatar] << "should be less than 1MB" if avatar.size > 1.megabytes
  end
end
