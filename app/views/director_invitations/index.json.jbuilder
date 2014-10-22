json.array!(@invitations) do |invitation|
  json.extract! invitation, :id, :name, :email, :state
  json.url invitation_url(invitation, format: :json)
end
