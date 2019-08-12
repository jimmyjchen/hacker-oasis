class HackerDay < ApplicationRecord
  belongs_to :project

  validates :location, :date, presence: true
  validates :user_id, uniqueness: true

  def users
    User.where(id: attendants)
  end
end
