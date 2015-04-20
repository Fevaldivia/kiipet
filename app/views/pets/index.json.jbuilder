json.array!(@pets) do |pet|
  json.extract! pet, :id, :name, :bio, :breed
  json.url pet_url(pet, format: :json)
end
