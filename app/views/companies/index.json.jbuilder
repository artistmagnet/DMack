json.array!(@companies) do |company|
  json.extract! company, :id, :name, :primary_contact_name, :description
  json.url company_url(company, format: :json)
end
