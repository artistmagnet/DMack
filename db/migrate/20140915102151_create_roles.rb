class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name
      t.integer :resume_id
      t.integer :production_id

      t.timestamps
    end
  end
end
