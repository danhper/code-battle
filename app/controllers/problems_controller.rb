class ProblemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_problem, except: [:index, :new, :create]
  before_action :check_creator!, only: [:edit, :update, :destroy]

  def index
    @problems = Problem.all
  end

  def show
  end

  def new
    @problem = Problem.new(params[:problem])
    @code = Code.new(params[:code])
  end

  def create
    @problem = current_user.created_problems.build(problem_params)
    @code = current_user.codes.build(code_params)
    if @problem.valid? && @code.valid?
      @problem.codes << @code
      @problem.save!
      redirect_to @problem
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
  def set_problem
    @problem = Problem.find(params[:id])
  end

  def problem_params
    params.require(:problem).permit(:title, :description)
  end

  def code_params
    params.require(:code).permit(:source)
  end

  def check_creator!
    if @problem.creator != current_user
      redirect_to root_path
    end
  end

end
