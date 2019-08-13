class TeamComment < ApplicationRecord
  belongs_to :user
  belongs_to :hacker_day
end
