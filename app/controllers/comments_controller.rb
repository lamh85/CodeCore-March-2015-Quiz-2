class CommentsController < ApplicationController

  before_action :authenticate_user!

  # CREATE

  def create
    idea = Idea.find(params[:idea_id])
    @comment = current_user.comments.new(comment_params)
    @comment.idea = idea

    if @comment.save
      flash[:notice] = "You have successfully added your comment"
      redirect_to idea_path(idea)
    else
      redirect_to idea_path(idea)
    end
  end

  # PRIVATE
  private

  # Method for authorizing multiple params
  def comment_params
    comment_params = params.require(:comment).permit(:body)
  end

end
