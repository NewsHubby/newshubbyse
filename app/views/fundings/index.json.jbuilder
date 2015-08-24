json.array!(@fundings) do |funding|
  json.extract! funding, :id, :investment_type, :date, :name, :sum, :press_room_id
  json.url funding_url(funding, format: :json)
end
