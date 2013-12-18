class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @show_code = !params[:page].nil?
    @codes = @user.created_codes.paginate(page: params[:page])
    @languages_stats = @user.language_usage_statistics
    @liked = @user.liked_by_guilds
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def demote
    @user.update! role: :normal
    redirect_to @user
  end

  def promote
    @user.update! role: :moderator
    redirect_to @user
  end

  private
  def user_params
    params.require(:user).permit(:username, :email)
  end
end
