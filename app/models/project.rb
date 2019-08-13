class Project < ApplicationRecord
  acts_as_taggable_on :tags
  mount_uploader :cover_photo, PhotoUploader
  belongs_to :user
  has_many :collaborations, dependent: :destroy
  has_many :comments, dependent: :destroy
#   validates :name, :description, :cover_photo, :photo1, presence: true
  has_many :hacker_days, dependent: :destroy
  # geocoded_by :location
  # after_validation :geocode, if: :will_save_change_to_location?

  # validates :name, :description, :cover_photo, :photo1, presence: true


  include PgSearch
  pg_search_scope :multisearchable,
    against: [ :name, :description ],
    associated_against: {
      user: [ :first_name, :last_name, :city, :country, :description, :username ]
    },
    using: {
      tsearch: {prefix: true}
    }
end
