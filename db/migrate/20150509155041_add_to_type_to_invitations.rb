class AddToTypeToInvitations < ActiveRecord::Migration
  def change
  	add_column :invitations,:to_type,:string
  end
end
