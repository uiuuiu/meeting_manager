json.array!(@profiles) do |profile|
  json.extract! profile, :id, :name, :level, :picture, :user_id
  json.url profile_url(profile, format: :json)
end
