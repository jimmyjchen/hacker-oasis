class Like < ApplicationRecord
  belongs_to :projects
  belongs_to :user
end
