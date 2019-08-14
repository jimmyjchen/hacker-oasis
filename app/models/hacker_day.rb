class HackerDay < ApplicationRecord
  belongs_to :project
  has_many :team_comments, dependent: :destroy
  geocoded_by :address
  validates :address, :date, presence: true
  after_validation :geocode, if: :will_save_change_to_address?

  def users
    User.where(id: attendants)
  end
end
