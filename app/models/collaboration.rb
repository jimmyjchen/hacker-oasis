class Collaboration < ApplicationRecord
  has_many :users
  has_one :project
end
