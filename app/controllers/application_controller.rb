class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate_user_with_username!
    authenticate_user!
    redirect_to edit_user_path(current_user) if current_user.username.blank?
  end

  def check_guild!
    redirect_to guilds_path, alert: 'choose a guild' if current_user.guilds.empty?
  end
end
