class HackerDaysController < ApplicationController
  def index
    @project = Project.find(params[:project_id])
    authorize @project
    # @hacker_days = HackerDay.all
  end

  def show
    @project = Project.find(params[:project_id])
    authorize @project
    @hacker_days = HackerDay.all
  end

  def new
    @project = Project.find(params[:project_id])
    authorize @project
    @hacker_day = HackerDay.new
  end

  def create
    @project = Project.find(params[:project_id])
    @hacker_day = HackerDay.new(params_hackerdays)
    # raise
    @hacker_day.project = @project
    @project.user = current_user
    authorize @project
    if @hacker_day.save
      redirect_to project_path(@project.id)
    else
      render 'new'
    end
  end

  private

  def params_hackerdays
    params.require(:hacker_day).permit(:project_id, :user_id, :location, :attendants, :date)
  end
end
