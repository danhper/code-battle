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
  end

  def create
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

  def check_creator!
    if @problem.creator != current_user
      redirect_to root_path
    end
  end

end
