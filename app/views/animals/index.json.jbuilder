json.array!(@animals) do |animal|
  json.extract! animal, :id, :name, :description, :photo
  json.url animal_url(animal, format: :json)
end
