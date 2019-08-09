class CollaborationsController < ApplicationController
  def index
    @collaborations = Collaboration.all
  end

  def new
    @user = User.new
    @collaboration = Collaboration.new
    @project = Project.find(params[:project_id])
  end

  def create
    # raise
    @username = params[:collaboration][:user]
    @user = User.find_by(username: @username)
    @collaboration = Collaboration.new
    @project = Project.find(params[:project_id])
    @collaboration.user = @user
    @collaboration.project = @project
    # @collaboration.project = @project
    authorize @collaboration
    if @collaboration.save
      redirect_to project_path(@project)
    else
      # render 'new'
      # flash.now[:alert] = 'Alert message!'
      redirect_to project_path(@project), alert: 'This user is already in your project!'

    end
  end

  def show
    # @collaboration = Collaboration.find()
  end

  def profile
    @collaboration = Collaboration.where(user: current_user)
  end

  private

  def params_collaboration
     params.require(:collaboration).permit(:project_id, :user_id, :active)
  end
end
