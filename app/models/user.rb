class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :avatar, PhotoUploader
  has_many :projects
  has_many :collaborations

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
