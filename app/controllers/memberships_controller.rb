class MembershipsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  # CREATE

  def create
    membership = current_user.memberships.new

    idea = Idea.find params[:idea_id]

    membership.idea = idea

    if membership.save
      redirect_to root_path, notice: "You have joined this idea!"
    else
      redirect_to root_path, alert: "You could not join this idea!"
    end

  end

  # DESTROY

  def destroy
    membership = current_user.memberships.find params[:id]
    membership.destroy
    redirect_to root_path, notice: "You have left this idea"
  end

end