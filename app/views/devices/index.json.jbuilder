json.array!(@devices) do |device|
  json.extract! device, :id, :reg_id, :user_id, :type, :latitude, :longitude
  json.url device_url(device, format: :json)
end
