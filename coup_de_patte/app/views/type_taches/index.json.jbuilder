json.array!(@type_taches) do |type_tach|
  json.extract! type_tach, :id, :nom
  json.url type_tach_url(type_tach, format: :json)
end
