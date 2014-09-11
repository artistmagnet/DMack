json.array!(@shows) do |show|
  json.extract! show, :id, :production, :company, :date
  json.url show_url(show, format: :json)
end
