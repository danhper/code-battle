class CommentsController < ApplicationController
  before_action :authenticate_user_with_username!, only: [:create, :destroy]
  before_action :set_comment, only: [:destroy]
  before_action :check_user!, only: [:destroy]

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      render json: @comment, status: 201
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

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def check_user!
    if @comment.user_id != current_user.id
      render json: { error: 'not authorized'}.to_json, status: 403
    end
  end

end
