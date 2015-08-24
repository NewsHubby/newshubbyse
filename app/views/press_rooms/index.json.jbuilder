json.array!(@press_rooms) do |press_room|
  json.extract! press_room, :id, :company_name, :twitter, :phone, :founded, :website, :press_email, :location
  json.url press_room_url(press_room, format: :json)
end
