json.array!(@roles) do |role|
  json.extract! role, :id, :name, :resume_id, :production_id
  json.url role_url(role, format: :json)
end
