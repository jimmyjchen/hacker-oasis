class Api::V1::LikesController < Api::V1::BaseController
  before_action :find_project

  def create
    @project = Project.find(params[:project_id])
    authorize @project
    if already_liked?
      flash[:notice] = "You can't like more than once"
    else
      @project.likes.create(user_id: current_user.id)
      noti = Notification.create(recipient: @project.user, actor: current_user, action: "liked your project", notifiable: @project)
    end
    redirect_to project_path(@project)
  end

  def destroy
    @like = Like.where(user_id: current_user.id, project_id:
    params[:project_id])
    authorize @like
    @like.last.destroy
    redirect_to project_path(@project)
  end

  private

  def already_liked?
    Like.where(user_id: current_user.id, project_id: params[:project_id]).exists?
  end

  def find_project
    @project = Project.find(params[:project_id])
  end
end
