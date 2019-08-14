class CommentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  skip_after_action :verify_policy_scoped, :only => :index
  def index
    @comments = policy_scope(Comment).where(project_id: params[:project_id])
    authorize @comments
    render json: @comments
  end

  def show
    # @project = Project.find(params[:project_id])
    @comment = Comment.find(params[:id])
    # authorize @project
    authorize @comment
    respond_to do |format|
      format.js
    end
  end

  def new
    @project = Project.find(params[:project_id])
    authorize @project
    @comment = Comment.new
  end

  def create
    @project = Project.find(params[:project_id])
    @comment = Comment.new(comment_params)
    # raise
    @comment.project = @project
    @comment.user = current_user
    authorize @project

    respond_to do |format|
      if @comment.save
        noti = Notification.create(recipient: @project.user, actor: current_user, action: "commented", notifiable: @comment)
        format.html { redirect_to project_path(@project) }
        format.js
      else
        format.html { render action: "new" }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
