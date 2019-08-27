class Api::V1::CommentsController < Api::V1::BaseController
  before_action :set_comment, only: [ :show, :update ]
  def index
    @comments = Comment.where(project_id: params[:project_id])
    # render json: @comments #Just for testing
  end

  def show
  end

  def update
    if @comment.update(comment_params)
      render :show
    else
      render_error
    end
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      render :show, status: :created
    else
      render_error
    end
  end

  def destroy
    @comment.destroy
    head :no_content
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:name, :description, :cover_photo)
  end

  def render_error
    render json: { errors: @comment.errors.full_messages },
    status: :unprocessable_entity
  end
end
