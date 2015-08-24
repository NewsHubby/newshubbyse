json.array!(@press_release_types) do |press_release_type|
  json.extract! press_release_type, :id, :name
  json.url press_release_type_url(press_release_type, format: :json)
end
