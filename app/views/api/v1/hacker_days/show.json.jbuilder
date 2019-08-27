json.extract! @project, :id, :name, :text
json.project @project.hacker_days do |hd|
  json.extract! hd, :date, :project_id, :address, :attendants
  json.date hd.created_at.strftime("%m/%d/%y")
end
