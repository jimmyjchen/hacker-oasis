class CommentsController < ApplicationController
  def new
    @project = Project.find(params[:id])
    @comment = Comment.new
  end

  def create

  end
end
