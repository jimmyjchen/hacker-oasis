class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = policy_scope(Notification).where(recipient: current_user).unread
    authorize @notifications
  end

  def mark_as_read
    @notifications = policy_scope(Notification).where(recipient: current_user).unread
    @notification.update_all(read_at: Time.zone.now)
  end
end
