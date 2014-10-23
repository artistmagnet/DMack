class AddRoleToInvitations < ActiveRecord::Migration
  def change
    add_column :invitations, :role, :string
  end
end
