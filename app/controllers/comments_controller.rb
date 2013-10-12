class CommentsController < ApplicationController
  before_action :authenticate_user_with_username!, only: [:create]

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      render json: @comment, status: 201
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :code_id)
  end

end
