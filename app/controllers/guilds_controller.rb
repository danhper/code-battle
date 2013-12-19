class GuildsController < ApplicationController
  prepend_before_action :set_guild, except: [:index, :new, :create]
  before_action :authenticate_user_with_username!, only: [:enter, :leave]

  def index
    @guilds = Guild.includes(:recent_users).order(url_safe_name: :asc).all
  end

  def show
    @users = @guild.users.paginate(page: params[:user_page])
    @codes = @guild.codes.paginate(page: params[:code_page])
  end

  def new
  end

  def edit
  end

  def update
  end

  def create
  end

  def destroy
  end

  def enter
    @guild.users << current_user
    head :no_content
  end

  def leave
    @guild.users.delete(current_user)
    head :no_content
  end

  private
  def set_guild
    @guild = Guild.find_by_url_safe_name(params[:id])
  end
end
