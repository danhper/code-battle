class CodesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_quest
  before_action :set_code, except: [:index, :new, :create]
  before_action :check_creator!, only: [:edit, :update, :destroy]

  def index
    @codes = Code.all
  end

  def new
    @code = @quest.codes.build(params[:code])
  end

  def show
    @is_owner = user_signed_in? && @code.author == current_user
  end

  def create
    @code = current_user.codes.build(code_params)
    @quest.codes << @code
    if @quest.save
      redirect_to [@quest, @code]
    else
      render action: :new
    end
  end

  def edit
  end

  def update
    if @code.update(code_params)
      redirect_to [@quest, @code]
    else
      render action: :edit
    end
  end

  def destroy
    @code.destroy
    redirect_to @quest
  end

  def like
    if current_user.likes_code?(@code)
      render json: { error: 'already likes code' }
    elsif @code.author == current_user
      render json: { error: 'cannot like own code' }
    else
      current_user.liked_codes << @code
      head :no_content
    end
  end

  def unlike
    if current_user.likes_code?(@code)
      current_user.liked_codes.delete(@code)
      head :no_content
    else
      render json: { error: 'does not like code' }
    end
  end

  private
  def set_quest
    @quest = Quest.find(params[:quest_id])
  end

  def set_code
    @code = Code.find(params[:id])
  end

  def code_params
    params.require(:code).permit(:source, :guild_id)
  end

  def check_creator!
    if @code.author != current_user
      redirect_to root_path
    end
  end
end
