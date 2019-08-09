class Project < ApplicationRecord
  acts_as_taggable_on :tags
  mount_uploader :cover_photo, PhotoUploader
  mount_uploader :photo1, PhotoUploader
  mount_uploader :photo2, PhotoUploader
  mount_uploader :photo3, PhotoUploader
  belongs_to :user
  has_many :collaborations, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :name, :description, :cover_photo, :photo1, presence: true
end
