class CommentsController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    authorize @project
    @comment = Comment.new
  end

  def create

  end
end
