json.projects do
  json.array! @projects do |project|
    json.extract! project, :id, :name, :description, :cover_photo
  end
end
