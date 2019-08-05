class Project < ApplicationRecord
  belongs_to :user
  has_one :collaboration
end
