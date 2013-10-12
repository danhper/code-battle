class UsersController < ApplicationController
  before_action :set_user
  before_action :check_user!, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def update
  end



  private
  def set_user
    @user = User.find(params[:id])
  end

  def check_user!
    redirect_to root_path unless current_user == @user
  end
end
