json.array!(@animals) do |animal|
  json.extract! animal, :id, :nom, :status_id, :prix_journalier, :ferme_id, :espece_id
  json.url animal_url(animal, format: :json)
end
