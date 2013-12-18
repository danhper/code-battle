class CommentsController < ApplicationController
  skip_load_resource only: [:create]
  before_action :authenticate_user_with_username!, only: [:create, :destroy]

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      render :show, status: 201
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def update
    if @comment.update(comment_params)
      head :no_content
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
    head :no_content
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :code_id)
  end
end
