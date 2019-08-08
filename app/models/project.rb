class Project < ApplicationRecord
  mount_uploader :cover_photo, PhotoUploader
  mount_uploader :photo1, PhotoUploader
  mount_uploader :photo2, PhotoUploader
  mount_uploader :photo3, PhotoUploader
  belongs_to :user
  has_many :collaborations
  has_many :comments

  validates :name, :description, :cover_photo, :photo1, presence: true
end
