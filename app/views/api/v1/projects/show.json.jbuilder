json.extract! @project, :id, :name, :description, :cover_photo

json.project @project.hacker_days do |h|
  json.extract! h, :date, :attendants, :address, :created_at
  json.date h.created_at.strftime("%m/%d/%y")
end


