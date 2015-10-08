json.array!(@zipcodes) do |zipcode|
  json.extract! zipcode, :id, :zip_code, :city, :county
  json.url zipcode_url(zipcode, format: :json)
end
