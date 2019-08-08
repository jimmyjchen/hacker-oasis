class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :avatar, AvatarUploader
  has_many :projects
  has_many :collaborations
  has_many :comments

  validates :email, :username, :avatar, uniqueness: true, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
