class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
 has_many :projects
 has_many :collaboration

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
