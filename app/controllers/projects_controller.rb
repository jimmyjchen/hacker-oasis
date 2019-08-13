class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_project, only: [:show, :update, :destroy, :edit]
  skip_after_action :verify_policy_scoped, :only => :index

  def index
    if params[:query].present?
      @projects = Project.multisearchable(params[:query])
    else
      @projects = policy_scope(Project).order(created_at: :desc)
    end
  end

  def new
    @project = Project.new
    authorize @project
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
    authorize @project
    if @project.save
      # Collaboration.create(user_id: current_user.id, project_id: @project.id)
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    @project.update(project_params)
    redirect_to project_path(@project)
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

  def edit
  end

  def show
    @hacker_days = HackerDay.where(project_id: @project.id)
    @hacker_day = @hacker_days.last
    # raise
    @comment = Comment.new
    @comments = @project.comments
    @team_comment = TeamComment.new
    # @collaboration = Collaboration.new
    # @users = User.all.order(username: :asc)
    @users = User.all.order(username: :asc).map{|user| user.username}
    # puts @users
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :cover_photo, :photo_cache, tag_list: [])
  end

  def set_project
    @project = Project.find(params[:id])
    authorize @project
  end
end
