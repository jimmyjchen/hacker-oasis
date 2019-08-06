class CollaborationsController < ApplicationController
  def index
    @collaborations = Collaboration.all
  end

  def new
    @collaboration = Collaboration.new
    @project = Project.find(params[:project_id])
  end

  def create
    @collaboration = collaboration.new(params_collaboration)
    @project = Project.find(params[:project_id])
    @collaboration.user = current_user
    @collaboration.project = @project
    # authorize @collaboration
    if @collaboration.save
      redirect_to 'root_path'
    else
      render 'new'
    end
  end

  def profile
    @collaboration = Collaboration.where(user: current_user)
  end

  private

  def params_collaboration
     params.require(:collaboration).permit(:project_id, :user_id)
  end
end
