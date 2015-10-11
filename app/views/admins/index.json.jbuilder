json.array!(@admins) do |admin|
  json.extract! admin, :id, :user_name, :password_digest
  json.url admin_url(admin, format: :json)
end
