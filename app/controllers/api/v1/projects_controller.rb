class Api::V1::ProjectsController < Api::V1::BaseController
  before_action :set_project, only: [ :show, :update ]
  def index
    @projects = Project.all
    # render json: @projects #Just for testing
  end

  def show
  end

  def update
    if @project.update(project_params)
      render :show
    else
      render_error
    end
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      render :show, status: :created
    else
      render_error
    end
  end

  def destroy
    @project.destroy
    head :no_content
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description, :cover_photo)
  end

  def render_error
    render json: { errors: @project.errors.full_messages },
    status: :unprocessable_entity
  end
end
