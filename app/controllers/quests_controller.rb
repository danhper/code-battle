class QuestsController < ApplicationController
  before_action :authenticate_user_with_username!, except: [:index, :show]
  before_action :set_quest, except: [:index, :new, :create]
  before_action :check_creator!, only: [:edit, :update, :destroy]
  before_action :check_guild!, only: [:new, :create]

  def index
    @quests = Quest.all
  end

  def show
    if user_signed_in?
      @code = Code.where(quest: @quest, user: current_user).first
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
      render action: 'new'
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
