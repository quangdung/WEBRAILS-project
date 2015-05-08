json.array!(@locations) do |location|
  json.extract! location, :id, :date, :dureeJour, :animal_id, :user_id, :statusLocation_id
  json.url location_url(location, format: :json)
end
