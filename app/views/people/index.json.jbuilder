json.array!(@people) do |person|
  json.extract! person, :id, :name, :position, :presentation, :press_room_id
  json.url person_url(person, format: :json)
end
