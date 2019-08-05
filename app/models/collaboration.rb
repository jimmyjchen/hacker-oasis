class Collaboration < ApplicationRecord
  has_many :user
  has_one :project
end
