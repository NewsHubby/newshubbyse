json.array!(@press_releases) do |press_release|
  json.extract! press_release, :id, :title, :slug, :hex, :exclusive, :embargo, :press_room_id, :press_release_type_id
  json.url press_release_url(press_release, format: :json)
end
