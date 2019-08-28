# json.projects do
#   json.array! @projects do |project|
#     json.extract! project, :id, :name, :description, :cover_photo，:hacker_day
#   end
# end

json.projects @projects do |pro|
  json.extract! pro, :name, :id, :description, :hacker_days
  json.date pro.created_at.strftime("%m/%d/%y")
end
