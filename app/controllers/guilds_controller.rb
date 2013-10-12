class GuildsController < ApplicationController
  before_action :set_guild, except: [:index, :new, :create]

  before_filter :authenticate_user!, only: [:enter, :leave]

  def index
    @guilds = Guild.all
  end

  def show
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
    @guild = Guild.find_by_name(params[:id])
  end

  def guild_params
    params.require(:guild).permit(:name)
  end
end
