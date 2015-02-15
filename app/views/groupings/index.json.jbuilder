json.array!(@groupings) do |grouping|
  json.extract! grouping, :id, :group_id, :friendship_id
  json.url grouping_url(grouping, format: :json)
end
