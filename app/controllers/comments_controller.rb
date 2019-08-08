class CommentsController < ApplicationController
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
    if @comment.save
      redirect_to project_path(@project)
    else
      render 'new'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

end
