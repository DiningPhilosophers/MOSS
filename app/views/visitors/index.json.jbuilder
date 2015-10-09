json.array!(@visitors) do |visitor|
  json.extract! visitor, :id, :last_name, :first_name, :group_id, :email, :contact, :zip_code, :country_id
  json.url visitor_url(visitor, format: :json)
end
