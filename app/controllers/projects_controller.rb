class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.save
    redirect_to root_path
  end

  def update
    @project = Project.find(params[:id])
    @project.update(project_params)
    redirect_to root_path
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to root_path
  end

  def edit
    @project = Project.find(params[:id])
  end

  def show
    @project = Project.find(params[:id])
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :cover_photo, :photo1, :photo2, :photo3)
  end
end
