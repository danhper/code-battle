class QuestsController < ApplicationController
  load_and_authorize_resource
  skip_load_resource only: [:create]
  skip_authorize_resource only: [:battle, :see_battle]

  before_action :authenticate_user_with_username!, except: [:index, :show, :see_battle]
  before_action :check_guild!, only: [:new, :create]

  require 'will_paginate/array'

  def index
    if !params[:regexp].blank?
      @quests = Quest.where("title like ?", "%#{params[:regexp]}%").includes(finalists: [:guild, :quest, :author]).paginate(page: params[:page]).by_date
    else
      @quests = Quest.includes(finalists: [:guild, :quest, :author]).paginate(page: params[:page]).by_date
    end
  end

  def show
    @guild = Guild.find_by_url_safe_name(params[:guild_id])
    if @guild.nil?
      @codes = @quest.codes.by_likes.paginate(page: params[:page])
     else
      @codes = @quest.guild_codes(@guild.id).paginate(page: params[:page])
    end

    @battles = @quest.battles.where.not(started_at: nil)

    @battle_mode = !params[:mode].nil? && params[:mode] == 'battle'

    if user_signed_in?
      @code = Code.where(quest_id: @quest, user_id: current_user).first
    end

    @greeting = params[:greeting]
  end

  def new
    @quest = Quest.new(params[:quest])
    @code = Code.new(params[:code])
  end

  def create
    @quest = current_user.created_quests.build(quest_params)
    @code = current_user.created_codes.build(code_params)
    @code.quest = @quest
    if @quest.valid? && @code.valid?
      @quest.codes << @code
      @quest.save!
      redirect_to @quest
    else
      render 'new'
    end
  end

  def battle
    @user_id = current_user.id
    @battle_token = nil
    @left_gladiator = current_user.current_battles.build(guild: current_user.guilds.first)
    @right_gladiator = Gladiator.new
  end

  def see_battle
    @user_id = -1
    @battle = Battle.find(params[:battle_id])
    return if @battle.users.count != 2
    @battle_token = @battle.token
    @left_gladiator = @battle.gladiators.first
    @right_gladiator = @battle.gladiators.last
    render :battle
  end

  def edit
  end

  def update
    if @quest.update(quest_params)
      redirect_to @quest
    else
      render :edit
    end
  end

  def destroy
    @quest.destroy
    redirect_to root_path
  end

  private
  def quest_params
    params.require(:quest).permit(:title, :description)
  end

  def code_params
    params.require(:code).permit(:source, :guild_id)
  end

end
