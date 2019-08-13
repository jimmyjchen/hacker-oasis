class HackerDay < ApplicationRecord
  belongs_to :project
  has_many :team_comments

  validates :location, :date, presence: true

  def users
    User.where(id: attendants)
  end
end
