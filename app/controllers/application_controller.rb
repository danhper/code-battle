class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  load_and_authorize_resource unless: :devise_controller?

  before_action :check_username!

  unless Rails.application.config.consider_all_requests_local
    rescue_from CanCan::AccessDenied, with: :rescue_access_denied
  end

  def current_ability
    @current_ability ||= Ability.new(current_user, params[:action].to_sym)
  end

  def after_sign_in_path_for(resource)
    if resource.is_a?(User)
      if resource.username.blank?
        edit_user_path(resource)
      else
        request.env['omniauth.origin'] || stored_location_for(resource) || root_path
      end
    end
  end

  def authenticate_user_with_username!
    authenticate_user!
    self.check_username!
  end

  def check_username!
    return if !user_signed_in?
    allowed_paths = [edit_user_path(current_user), destroy_user_session_path, user_path(current_user)]
    if !allowed_paths.include?(request.path) && user_signed_in? && current_user.username.blank?
      redirect_to edit_user_path(current_user), alert: 'user.enter_username'
    end
  end

  def check_guild!
    redirect_to guilds_path, alert: 'guild.please_enter' if current_user.guilds.empty?
  end

  protected
  def rescue_access_denied(e)
    respond_to do |format|
      format.html { redirect_to root_path, alert: e.message }
      format.json { render json: { error: e.message}, status: 403 }
    end
  end
end
