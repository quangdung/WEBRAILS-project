json.array!(@fermes) do |ferme|
  json.extract! ferme, :id, :nom, :adresse, :gerant_id
  json.url ferme_url(ferme, format: :json)
end
