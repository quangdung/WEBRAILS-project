json.array!(@especes) do |espece|
  json.extract! espece, :id, :nom
  json.url espece_url(espece, format: :json)
end
