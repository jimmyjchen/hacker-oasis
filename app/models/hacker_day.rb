class HackerDay < ApplicationRecord
  belongs_to :project

  def users
    User.where(id: attendants)
  end
end
