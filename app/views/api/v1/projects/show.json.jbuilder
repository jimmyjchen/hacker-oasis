json.extract! @project, :id, :name, :description, :cover_photo

json.hacker_session @project.hacker_days do |h|
  json.extract! h, :date, :attendants, :address
  json.date h.created_at.strftime("%m/%d/%y")
end

json.comments @project.comments do |c|
  json.extract! c, :content, :user_id
  json.date c.created_at.strftime("%b %e, %l:%M %p")
end

json.likes @project.likes do |l|
  json.extract! l, :user_id
end



