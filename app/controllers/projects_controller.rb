class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!

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
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    @project = Project.find(params[:id])
    @project.update(project_params)
    authorize @project
    redirect_to root_path
  end

  def destroy
    @project = Project.find(params[:id])
    authorize @project
    @project.destroy
    redirect_to projects_path
  end

  def edit
    @project = Project.find(params[:id])
    authorize @project
  end

  def show
    @project = Project.find(params[:id])
    authorize @project
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :cover_photo, :photo1, :photo2, :photo3)
  end
end
