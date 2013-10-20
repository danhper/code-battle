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
    @best_code = @quest.get_top_codes.first
    @is_owner = user_signed_in? && @code.author == current_user
    @liked = user_signed_in? && current_user.likes_code?(@code)
    @voted = user_signed_in? && current_user.votes_quest?(@quest)
    @other_codes = @quest.codes.where('codes.user_id != ?', @code.author.id).order('created_at DESC').limit(5)
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
    unless current_user.in_guild?(@code.guild)
      render json: { error: 'can only like own guild' }, status: 400
    end
    if current_user.likes_code?(@code)
      render json: { error: 'already likes code' }, status: 400
    elsif @code.author == current_user
      render json: { error: 'cannot like own code' }, status: 400
    else
      current_user.likes << @code
      head :no_content
    end
  end

  def unlike
    if current_user.likes_code?(@code)
      current_user.likes.delete(@code)
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
      qtv = QuestTotalVote.create_with(vote_num: 0).find_or_create_by(quest_id: @quest.id, voting_guild_id: current_user.large_guild.id, voted_guild_id: @code.guild_id)
      qtv.inc_num
      tv = TotalVote.create_with(vote_num: 0).find_or_create_by(voting_guild_id: current_user.large_guild.id, voted_guild_id: @code.guild_id)
      tv.inc_num
      head :no_content
    end
  end

  def unvote
    if current_user.votes_quest?(@quest)
      Vote.where(user_id: current_user, quest_id: @quest.id).first.destroy
      qtv = QuestTotalVote.where(quest_id: @quest.id, voting_guild_id: current_user.large_guild.id, voted_guild_id: @code.guild_id).first
      #qtv.dec_num
      tv = TotalVote.where(voting_guild_id: current_user.large_guild.id, voted_guild_id: @code.guild_id).first
      tv.dec_num
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
