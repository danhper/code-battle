class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

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
    redirect_to edit_user_path(current_user) if current_user.username.blank?
  end

  def check_guild!
    redirect_to guilds_path, alert: 'guild.please_enter' if current_user.guilds.empty?
  end
end
