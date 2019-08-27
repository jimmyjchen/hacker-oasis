json.extract! @user, :id, :username, :email

json.project @user.projects do |pro|
  json.extract! pro, :name, :id, :description, :hacker_days
  json.date pro.created_at.strftime("%m/%d/%y")
end
