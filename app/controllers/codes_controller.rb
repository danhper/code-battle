class CodesController < ApplicationController
  before_action :set_quest
  def index
  end

  def new
    @code = @quest.codes.build(params[:code])
  end

  def show
  end

  def create
    @code = Code.new(code_params)
    if @code.save
      redirect_to [@quest, @code]
    else
      render action: :new
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
end
