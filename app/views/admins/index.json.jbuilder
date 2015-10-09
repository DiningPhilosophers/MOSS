json.array!(@admins) do |admin|
  json.extract! admin, :id, :user_name, :password
  json.url admin_url(admin, format: :json)
end
