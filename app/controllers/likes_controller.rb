class LikesController < ApplicationController
  before_action :find_project

  def create
    if already_liked?
      flash[:notice] = "You can't like more than once"
    else
      @project.likes.create(user_id: current_user.id)
    end
    redirect_to project_path(@project)
  end

  private

  def already_liked?
    Like.where(user_id: current_user.id, project_id:
    params[:project_id]).exists?
  end

  def find_project
    @project = Project.find(params[:project_id])
  end

end
