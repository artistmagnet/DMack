class AddDirectorToRoles < ActiveRecord::Migration
  def change
    add_column :roles, :director_id, :string
    add_column :roles, :dirname, :string
    add_column :roles, :diremail, :string
  end
end
