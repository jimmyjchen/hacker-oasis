json.comments do
  json.array! @comments do |c|
    json.extract! c, :id, :content, :project_id, :user_id
  end
end
