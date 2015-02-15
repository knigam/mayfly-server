json.array!(@invites) do |invite|
  json.extract! invite, :id, :user_id, :event_id, :attending, :creator
  json.url invite_url(invite, format: :json)
end
