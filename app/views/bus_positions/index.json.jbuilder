json.array!(@bus_positions) do |bus_position|
  json.extract! bus_position, :id, :bus_id, :time, :latitude, :longitude, :speed
  json.url bus_position_url(bus_position, format: :json)
end
