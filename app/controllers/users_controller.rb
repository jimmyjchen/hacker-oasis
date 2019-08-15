class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    authorize @user
    @sessions_array = []
    HackerDay.all.each do |x|
      if x.attendants.include?(@user.id.to_s)
        @sessions_array << x
      end
    end
    # authorize @project
    # @hacker_days = HackerDay.find(params[:id])
  end
end
