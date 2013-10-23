class GuildsController < ApplicationController
  before_filter :authenticate_user_with_username!, only: [:enter, :leave]
  before_action :set_guild, except: [:index, :new, :create]

  def index
    @guilds = Guild.includes(:recent_users).all
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
    if @guild.users.exists?(current_user)
      render json: { error: 'already in guild' }
    else
      @guild.users << current_user
      head :no_content
    end
  end

  def leave
    if @guild.users.exists?(current_user)
      @guild.users.delete(current_user)
      head :no_content
    else
      render json: { error: 'already in guild' }
    end
  end

  private
  def set_guild
    @guild = Guild.find_by_url_safe_name(params[:id])
  end
end
