class TeamCommentsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @project = Project.find(params[:project_id])
    @hacker_day = @project.hacker_days.last
    authorize @project
    @team_comment = TeamComment.new
  end

  def create
    @project = Project.find(params[:project_id])
    @hacker_day = @project.hacker_days.last
    @team_comment = TeamComment.new(team_comment_params)
    # raise
    @team_comment.hacker_day = @hacker_day
    @team_comment.user = current_user
    authorize @project

    respond_to do |format|
      if @team_comment.save
        Notification.create(recipient: @project.user, actor: current_user, action: "commented", notifiable: @comment)
        format.html { redirect_to project_path(@project) }
        format.js
      else
        format.html { render action: "new" }
      end
    end
  end

  private

  def team_comment_params
    params.require(:team_comment).permit(:content)
  end
end
