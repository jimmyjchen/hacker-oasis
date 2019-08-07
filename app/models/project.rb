class Project < ApplicationRecord
  mount_uploader :cover_photo, PhotoUploader
  mount_uploader :photo1, PhotoUploader
  mount_uploader :photo2, PhotoUploader
  mount_uploader :photo3, PhotoUploader
  belongs_to :user
  has_one :collaboration
  has_many :comments
end
