class TeamCommentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  skip_after_action :verify_policy_scoped, :only => :index
  def index
    @hacker_day = HackerDay.find_by(project_id: params[:project_id])
    @team_comments = @hacker_day.team_comments
    authorize @team_comments
    render json: @team_comments
  end

  def show
    @team_comment = TeamComment.find(params[:id])
    authorize @team_comment
    respond_to do |format|
      format.js
    end
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
        # noti = Notification.create(recipient: @project.user, actor: current_user, action: "commented on your team under project", notifiable: @project)
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
