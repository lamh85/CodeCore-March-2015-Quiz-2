class IdeasController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  # CREATE

  def new
    @idea = Idea.new
  end

  def create
    @idea = current_user.ideas.create(idea_params)

    if @idea.save
      flash[:notice] = "You have successfully created your idea"
      redirect_to idea_path(@idea)
    else
      render :new
    end
  end

  # READ

  def index
    @idea = Idea.all
    # @membership = @idea.memberships.find_by_user_id(user.id) if user_signed_in?
  end

  def show
    @idea = Idea.find(params[:id])
    @comment = Comment.new
    @comments = @idea.comments
  end

  # UPDATE

  def edit
    @idea = Idea.find(params[:id])
  end

  def update
    @idea  = Idea.find(params[:id])
    if @idea.update(idea_params)
      redirect_to @idea, notice: "You have successfully updated this idea!"
    else
      render :edit
    end
  end

  # DESTROY

  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy
    redirect_to ideas_path    
  end

  # PRIVATE
  private

  # Method for authorizing multiple params
  def idea_params
    idea_params = params.require(:idea).permit(:title, :body, :image)
  end
end
