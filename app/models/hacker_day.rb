class HackerDay < ApplicationRecord
  belongs_to :project

  validates :location, :date, presence: true

  def users
    User.where(id: attendants)
  end
end
