json.hacker_days do
  json.array! @hacker_days do |hd|
    json.extract! hd, :date, :project_id, :address
  end
end
