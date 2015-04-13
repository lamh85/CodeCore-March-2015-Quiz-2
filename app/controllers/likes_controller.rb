class LikesController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  # CREATE

  def create
    like = current_user.likes.new

    idea = Idea.find params[:idea_id]

    like.idea = idea

    if like.save
      redirect_to root_path, notice: "You have 'Liked' this idea!"
    else
      redirect_to root_path, alert: "You could not 'Like' this idea!"
    end
  end

  # DESTROY

  def destroy
    like = current_user.likes.find_by_idea_id params[:idea_id]
    like.destroy
    redirect_to root_path, notice: "You have 'Un-Liked' this idea"
  end

end
