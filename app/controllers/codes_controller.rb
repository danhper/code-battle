class CodesController < ApplicationController
  before_action :authenticate_user_with_username!, except: [:index, :show]
  before_action :set_quest
  before_action :set_code, except: [:index, :new, :create]
  before_action :check_creator!, only: [:edit, :update, :destroy]
  before_action :check_guild!, only: [:new, :create]
  before_action :check_existence!, only: [:new, :create]

  def index
    @codes = Code.all
  end

  def new
    @code = @quest.codes.build(params[:code])
  end

  def show
    @is_owner = user_signed_in? && @code.author == current_user
    @liked = user_signed_in? && current_user.likes_code?(@code)
    @voted = user_signed_in? && current_user.votes_quest?(@quest)
  end

  def create
    @code = current_user.created_codes.build(code_params)
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
      render json: { error: 'already likes code' }, status: 400
    elsif @code.author == current_user
      render json: { error: 'cannot like own code' }, status: 400
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
      render json: { error: 'does not like code' }, status: 400
    end
  end

  def vote
    if current_user.votes_quest?(@quest)
      render json: { error: 'already votes code' }, status: 400
    elsif @code.author == current_user
      render json: { error: 'cannot vote own code' }, status: 400
    else
      Vote.create(user_id: current_user.id, quest_id: @quest.id, guild_id: @code.guild_id)
      head :no_content
    end
  end

  def unvote
    if current_user.votes_quest?(@quest)
      Vote.where(user_id: current_user, quest_id: @quest.id).destroy
      head :no_content
    else
      render json: { error: 'does not vote code' }, status: 400
    end
  end

  private
  def set_quest
    @quest = Quest.find(params[:quest_id])
  end

  def set_code
    @code = Code.find(params[:id])
  end

  def check_existence!
    redirect_to @quest if Code.where(user_id: current_user, quest_id: @quest).exists?
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
