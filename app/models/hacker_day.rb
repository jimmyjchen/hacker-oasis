class HackerDay < ApplicationRecord
  belongs_to :project
  has_many :team_comments, dependent: :destroy
  geocoded_by :location
  # after_validation :geocode, if: :will_save_change_to_location?
  validates :location, :date, presence: true

  def users
    User.where(id: attendants)
  end
end
