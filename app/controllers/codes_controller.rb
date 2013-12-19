class CodesController < ApplicationController
  before_action :authenticate_user_with_username!, except: [:index, :show]
  load_and_authorize_resource :quest
  skip_load_resource only: [:create]

  before_action :check_guild!, only: [:new, :create]
  before_action :check_existence!, only: [:new, :create]

  def index
    @codes = Code.all
  end

  def new
    @code = @quest.codes.build(params[:code])
  end

  def show
    @best_code = @quest.best_code
    @is_owner = user_signed_in? && @code.author == current_user
    @liked = user_signed_in? && current_user.likes_code?(@code)
    @voted = user_signed_in? && current_user.votes_guild?(@quest, @code.guild)
    @other_codes = @quest.codes.where('codes.user_id != ?', @code.author.id).order('created_at DESC').limit(5)
  end

  def create
    @code = current_user.created_codes.build(code_params)
    @quest.codes << @code
    if @quest.save
      redirect_to [@quest, @code]
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @code.update(code_params)
      redirect_to [@quest, @code]
    else
      render :edit
    end
  end

  def destroy
    @code.destroy
    redirect_to @quest
  end

  def like
    current_user.likes << @code
    head :no_content
  end

  def unlike
    current_user.likes.delete(@code)
    head :no_content
  end

  def vote
    Vote.create!(user_id: current_user.id, quest_id: @quest.id, guild_id: @code.guild_id, voting_guild_id: current_user.large_guild.id)
    qtv = QuestTotalVote.create_with(vote_num: 0).find_or_create_by(quest_id: @quest.id, voting_guild_id: current_user.large_guild.id, voted_guild_id: @code.guild_id)
    qtv.inc_num
    tv = TotalVote.create_with(vote_num: 0).find_or_create_by(voting_guild_id: current_user.large_guild.id, voted_guild_id: @code.guild_id)
    tv.inc_num
    head :no_content
  end

  def unvote
    vote_temp = Vote.where(user_id: current_user, quest_id: @quest.id).first
    qtv = QuestTotalVote.where(quest_id: @quest.id, voting_guild_id: vote_temp.voting_guild_id, voted_guild_id: @code.guild_id).first
    qtv.dec_num
    tv = TotalVote.where(voting_guild_id: vote_temp.voting_guild_id, voted_guild_id: @code.guild_id).first
    tv.dec_num
    vote_temp.destroy
    head :no_content
  end

  private

  def check_existence!
    redirect_to @quest if Code.where(user_id: current_user, quest_id: @quest).exists?
  end

  def code_params
    params.require(:code).permit(:source, :guild_id)
  end
end
