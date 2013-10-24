class QuestsController < ApplicationController
  before_action :authenticate_user_with_username!, except: [:index, :show]
  before_action :set_quest, except: [:index, :new, :create]
  before_action :check_creator!, only: [:edit, :update, :destroy]
  before_action :check_guild!, only: [:new, :create]

  require 'will_paginate/array'

  def index
    @quests = Quest.includes(:finalists, :creator).paginate(page: params[:page]).by_date
  end

  def show
    @codes = @quest.codes.by_likes.paginate(page: params[:page])

    if user_signed_in?
      @code = Code.where(quest_id: @quest, user_id: current_user).first
    end

    @greeting = params[:greeting]
  end

  def show_guild_codes    
    #@guild = (params[:guild_id].to_i) != 0 ? Guild.find(params[:guild_id]) : Guild.find_by_url_safe_name(params[:guild_id])
    @guild = Guild.find(params[:guild_id])
    if @guild.nil?
      redirect_to :action => 'show'
    else
      @codes = @quest.guild_codes(@guild.id).paginate(page: params[:page])
      
      if user_signed_in?
        @code = Code.where(quest_id: @quest, user_id: current_user).first
      end
    end     
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
