class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_project, only: [:show, :update, :destroy, :edit]

  def index
    @projects = policy_scope(Project).order(created_at: :desc)
  end

  def new
    @project = Project.new
    authorize @project
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
    authorize @project
    if @project.save
      Collaboration.create(user_id: current_user.id, project_id: @project.id)
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    @project.update(project_params)
    redirect_to project_path(@project)
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

  def edit
  end

  def show
    @project = Project.find(params[:id])
    # raise
    @comment = Comment.new
    @collaboration = Collaboration.new
    # @users = User.all.order(username: :asc)
    @users = User.all.order(username: :asc).map{|user| user.username}
    # puts @users
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :cover_photo, :photo1, :photo2, :photo3, :photo_cache, tag_list: [])
  end

  def set_project
    @project = Project.find(params[:id])
    authorize @project
  end
end
