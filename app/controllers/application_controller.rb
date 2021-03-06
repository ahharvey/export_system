require "application_responder"

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, prepend: true
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :user_for_draftsman
  before_action :set_draftsman_whodunnit

  before_action :set_locale

  before_action :set_currently_signed_in
  after_action :flash_to_headers

  self.responder = ApplicationResponder
  respond_to :html

  rescue_from CanCan::AccessDenied do |exception| #, with: :access_denied
    if @currently_signed_in.nil?
      session[:next] = request.fullpath
      puts session[:next]
      redirect_to new_user_session_url, alert: "You must log in to continue."
    else
      #render :file => "#{Rails.root}/public/403.html", :status => 403
      if request.env["HTTP_REFERER"].present?
        redirect_to :back, alert: exception.message
      else
        redirect_to root_url, alert: exception.message
      end
    end
  end

  # in production redirects to 404 if url does not exist
  # in other environments displays real exceptions
  unless Rails.application.config.consider_all_requests_local
    rescue_from ActionController::RoutingError, with: -> { render_404  }
  end

  #add_flash_types :error, :success, :info




  #before_filter :authenticate!

  # Override default Cancan current ability to fetch a specific one
  def current_ability
    @current_ability ||= case
    when current_user
      Ability.new(current_user)
    when current_admin
      Ability.new(current_admin)
    else Ability.new(User.new)
    end
  end

  # Custom authenticate to handle current user or admin
  def authenticate!
    if admin_signed_in?
      authenticate_admin!
      @currently_signed_in ||= current_admin
    else
      authenticate_user!
      @currently_signed_in ||= current_user
    end
  end

  def set_currently_signed_in
    if admin_signed_in?
      @currently_signed_in ||= current_admin
    else
      @currently_signed_in ||= current_user
    end
  end

  def user_for_paper_trail
    #admin_signed_in? ? current_admin.id : 'Guest'  # or whatever

    "#{@currently_signed_in.class.to_s}:#{@currently_signed_in.id}" rescue 'Guest'
  end




  def track_activity(trackable, action = params[:action])
    @currently_signed_in.activities.create! action: action, trackable: trackable
  end

  def restrict_access
    authenticate_or_request_with_http_token do |token, options|
      Admin.exists?(access_token: token)
    end
  end

  before_filter :staff_dashboard
  def staff_dashboard
    if admin_signed_in?
      pendingVessels      = PendingVessel.pending.size
      pendingUnloadings   = Unloading.where(vessel_id: current_admin.managed_vessels.map(&:id), review_state: 'pending' ).size
      pendingBaitLoadings = BaitLoading.where(vessel_id: current_admin.managed_vessels.map(&:id), review_state: 'pending' ).size
      @staff_dashboard_pending = pendingVessels + pendingUnloadings + pendingBaitLoadings
    end
  end

  def flash_to_headers
    return unless request.xhr?
    response.headers['X-Message'] = flash_message
    response.headers["X-Message-Type"] = twitterized_type( flash_type )

    flash.discard # don't want the flash to appear when you reload page
  end


  protected

  def configure_permitted_parameters
    if resource_class == Admin
      #devise_parameter_sanitizer.for(:sign_up) << [:name, :office_id]
      #devise_parameter_sanitizer.for(:invite) << [:office_id, :approved]
      #devise_parameter_sanitizer.for(:accept_invitation) << [:name]
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :office_id])
      devise_parameter_sanitizer.permit(:invite, keys: [:office_id, :approved])
      devise_parameter_sanitizer.permit(:accept_invitation, keys: [:name])
#    else
#      devise_parameter_sanitizer.for(:sign_up) << []
#      devise_parameter_sanitizer.for(:invite) << []
#      devise_parameter_sanitizer.for(:accept_invitation) << []
    end

  end


  private

  def user_for_draftsman
    return nil                unless ( user_signed_in? || admin_signed_in? )
    return current_user.id    if user_signed_in?
    return current_admin.id   if admin_signed_in?
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

#  def default_url_options(options = {})
#    { locale: I18n.locale }.merge options
#  end

  def default_url_options
    { locale: I18n.locale }
  end



  def flash_message
    [:alert, :error, :notice, :success, nil].each do |type|
      return "" if type.nil?
      return flash[type] unless flash[type].blank?
    end
  end

  def flash_type
    [:alert, :error, :notice, :success, nil].each do |type|
      return "" if type.nil?
      return type unless flash[type].blank?
    end
  end

  def twitterized_type(type)
    case type.to_s
    when 'alert'
      "warning"
    when 'error'
      'danger'
    when 'notice'
      "info"
    when 'success'
      "success"
    else
      type.to_s
    end
  end



end
