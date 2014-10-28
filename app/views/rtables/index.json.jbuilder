json.array!(@rtables) do |rtable|
  json.extract! rtable, :id, :title, :columns, :positions, :type
  json.url rtable_url(rtable, format: :json)
end
