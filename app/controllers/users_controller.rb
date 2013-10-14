class UsersController < ApplicationController
  before_action :set_user
  before_action :check_user!, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @codes = @user.created_codes.paginate(page: params[:page])
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render action: :edit
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email)
  end

  def check_user!
    redirect_to root_path unless current_user == @user
  end
end
