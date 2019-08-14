class HackerDaysController < ApplicationController

  def index
    # @project = Project.find(params[:project_id])
    # authorize @project
    # where(project_id: @project.id).
  end

  def show
    @project = Project.find(params[:project_id])
    authorize @project
    @hacker_days = HackerDay.find(params[:id])
  end

  def new
    @project = Project.find(params[:project_id])
    authorize @project
    @hacker_day = HackerDay.new
  end

  def create
    @project = Project.find(params[:project_id])
    @hacker_day = HackerDay.new(params_hackerdays)
    @hacker_day.project = @project
    @project.user = current_user
    @hacker_day.attendants.push(current_user.id.to_s)
    authorize @project
    if @hacker_day.save
      redirect_to project_path(@project.id)
    else
      render 'new'
    end
  end

  def update
    @project = Project.find(params[:project_id])
    @hacker_day = HackerDay.find(params[:id])
    authorize @hacker_day
    @hacker_day.update(params_hackerdays)
    if @hacker_day.update(params_hackerdays)
      noti = Notification.create(recipient: @project.user, actor: User.find(params_hackerdays["attendants"].last), action: "joined your hack session", notifiable: @project)
      # redirect_to project_hacker_day_path(@project.id, @hacker_day.id)
      redirect_to project_path(@project.id)
    else
      render 'new'
    end
  end

  private

  def params_hackerdays
    params.require(:hacker_day).permit(:project_id, :user_id, :address, :longitude, :latitude, :date, attendants: [])
  end
end
