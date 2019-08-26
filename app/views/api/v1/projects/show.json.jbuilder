json.extract! @project, :id, :name, :description, :cover_photo

# json.project @project.hacker_days do |hd|
#   json.extract! hd, :date, :attendants, :address
#   json.date hd.created_at.strftime("%m/%d/%y")
# end
