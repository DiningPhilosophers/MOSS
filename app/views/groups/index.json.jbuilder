json.array!(@groups) do |group|
  json.extract! group, :id, :group_size, :visit_date
  json.url group_url(group, format: :json)
end
