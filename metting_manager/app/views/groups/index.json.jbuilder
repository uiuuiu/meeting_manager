json.array!(@groups) do |group|
  json.extract! group, :id, :name, :user_id, :desc
  json.url group_url(group, format: :json)
end
