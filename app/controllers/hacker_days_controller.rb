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
    @hacker_day = HackerDay.find(params[:id])

  end
end
