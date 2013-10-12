class CodesController < ApplicationController
  def index
  end

  def new
    @problem = Problem.find(params[:problem_id])
    @code = @problem.codes.build(params[:code])
  end

  def create
    @code = Code.new(code_params)
    if @code.save
      redirect_to @code
    else
      render action: :new
    end
  end

  private
  def set_code
    @code = Code.find(params[:id])
  end

  def code_params
    params.require(:code).permit(:source, :guild_id)
  end
end
