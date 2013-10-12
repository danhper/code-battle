class GuildsController < ApplicationController
  def index
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

  private
  def set_guild
    @guild = Guild.find(params[:id])
  end

  def guild_params
    params.require(:guild).permit(:name)
  end


end
