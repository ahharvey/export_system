class Supervisor::DashboardController < ApplicationController
	#authorize_resource :class => false
  def index
    authorize! :index, 'supervisor/dashboard'
		
    @surveys = Survey.where(fishery_id: current_admin.member_fisheries.map(&:id) )
    @unapproved_surveys = @surveys.where( review_state: 'pending' )
    @historical_surveys = @surveys.
      where( review_state: 'approved' ).
      where('date_published > ?', Date.today.beginning_of_month-1.year).
      group_by { |t| t.date_published.beginning_of_month }
		
    @logbooks = Logbook.where(fishery_id: current_admin.member_fisheries.map(&:id) )
    @unapproved_logbooks = @logbooks.where( review_state: 'pending' )
    @historical_logbooks = @logbooks.
      where( review_state: 'approved').
      where('date > ?', Date.today.beginning_of_month-1.year).
      group_by { |t| t.date.beginning_of_month }

		@admins = Admin.where(approved: false, office_id: current_admin.office_id)

    @historical_records = []

    (@historical_surveys.keys + @historical_logbooks.keys).uniq.sort.each { |month|
      @historical_records << { month: month, survey: @historical_surveys[month].try(:length) || 0, logbook: @historical_logbooks[month].try(:length) || 0 }
    }
	end
end