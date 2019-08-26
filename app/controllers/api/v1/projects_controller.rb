class Api::V1::ProjectsController < Api::V1::BaseController
  def index
    @projects = Project.all
    render json: @projects #Just for testing
  end

end
