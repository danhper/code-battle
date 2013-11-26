class QuestsController < ApplicationController
  before_action :authenticate_user_with_username!, except: [:index, :show]
  before_action :set_quest, except: [:index, :new, :create]
  before_action :check_creator!, only: [:edit, :update, :destroy]
  before_action :check_guild!, only: [:new, :create]

  require 'will_paginate/array'

  def index
    if !params[:regexp].nil? && params[:regexp] != ""
      @quests = Quest.where("title like ?", "%#{params[:regexp]}%").includes(finalists: [:guild, :quest, :author]).paginate(page: params[:page]).by_date
    else
      @quests = Quest.includes(finalists: [:guild, :quest, :author]).paginate(page: params[:page]).by_date
    end
  end

  def show
    @guild = Guild.find_by_url_safe_name(params[:guild_id]);
    if @guild.nil?
      @codes = @quest.codes.by_likes.paginate(page: params[:page])
     else
      @codes = @quest.guild_codes(@guild.id).paginate(page: params[:page])
    end

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
    @quest = current_user.created_quests.build(quest)
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
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def set_quest
    @quest = Quest.find(params[:id])
  end

  def quest
    params.require(:quest).permit(:title, :description)
  end

  def code_params
    params.require(:code).permit(:source, :guild_id)
  end

  def check_creator!
    if @quest.creator != current_user
      redirect_to root_path
    end
  end

end
