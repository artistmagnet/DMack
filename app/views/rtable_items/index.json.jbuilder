json.array!(@rtable_items) do |rtable_item|
  json.extract! rtable_item, :id, :values, :position
  json.url rtable_item_url(rtable_item, format: :json)
end
