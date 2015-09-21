json.extract! @event, :id, :name, :description, :start_time, :end_time, :location, :min, :max, :open, :active, :created_at, :updated_at
json.users_attending Invite.where(event_id: @event, attending: true).map{|i| {id: i.user.id, name: i.user.name}}
