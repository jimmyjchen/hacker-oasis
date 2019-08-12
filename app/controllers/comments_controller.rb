class CommentsController < ApplicationController
  def index
  end

  def show
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
