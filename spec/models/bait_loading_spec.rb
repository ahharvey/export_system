# == Schema Information
#
# Table name: bait_loadings
#
#  id                :integer          not null, primary key
#  date              :date
#  vessel_id         :integer
#  location          :string
#  fish_id           :integer
#  quantity          :integer
#  unloading_id      :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  price             :integer
#  method_type       :string
#  review_state      :string           default("pending")
#  grid_id           :integer
#  secondary_fish_id :integer
#  bait_id           :integer
#  secondary_bait_id :integer
#  reviewer_id       :integer
#  reviewed_at       :datetime
#



require 'rails_helper'

RSpec.describe BaitLoading do



  let(:bait_loading1) { create :bait_loading, date: Time.now-1.hour }
  let(:bait_loading2) { create :bait_loading, date: Time.now }
  let(:bait)          { create :bait }

  it_behaves_like "reviewable"

  describe 'associations' do
    context 'belongs to' do
      it { is_expected.to belong_to(:vessel) }
      it { is_expected.to belong_to(:fish) }
      it {
        is_expected.to belong_to(:secondary_fish).
          class_name('Fish').
          with_foreign_key('secondary_fish_id')
        }
      it { is_expected.to belong_to(:grid) }
      it { is_expected.to belong_to(:unloading) }
      it { is_expected.to belong_to(:bait) }
      it {
        is_expected.to belong_to(:secondary_bait).
          class_name('Bait').
          with_foreign_key('secondary_bait_id')
        }
      it {
        is_expected.to belong_to(:reviewer).
          class_name('User')
        }
    end
  end

  describe ".default" do
    it "includes all records" do
      bait_loading1
      bait_loading2
      expect( BaitLoading.default.count).to eq 2
    end
    it "should be ordered by name" do
      expect( BaitLoading.default).to eq([bait_loading2, bait_loading1])
    end
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:vessel) }
    it { is_expected.to validate_presence_of(:bait) }
    it { is_expected.to validate_presence_of(:quantity) }
    it {
      is_expected.to validate_numericality_of(:quantity).
        only_integer.
        is_greater_than_or_equal_to(1).
        is_less_than_or_equal_to(999)
    }
    it {
      is_expected.to validate_inclusion_of(:method_type).
        in_array( %w{ bagan purse beach bouke } )
    }

  end

  describe "#bait_code" do
    let(:bait_loading) { create :bait_loading, bait_code: bait.code }
    before :each do
      bait
    end
    it "sets the bait_id" do
      expect( BaitLoading.new(bait_code: bait.code).bait_id ).to eq bait.id
    end
    it "returns the wpp code" do
      expect(bait_loading.bait_code).to eq bait.code
    end
  end

  describe "#secondary_bait_code" do
    let(:bait_loading) { create :bait_loading, secondary_bait_code: bait.code }
    before :each do
      bait
    end
    it "sets the bait_id" do
      expect( BaitLoading.new(secondary_bait_code: bait.code).secondary_bait_id ).to eq bait.id
    end
    it "returns the wpp code" do
      expect(bait_loading.secondary_bait_code).to eq bait.code
    end
  end



end
