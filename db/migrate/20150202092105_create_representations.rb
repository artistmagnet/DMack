class CreateRepresentations < ActiveRecord::Migration
  def change
    create_table :representations do |t|
      t.integer :resume_id
      t.string :company
      t.string :contact_name
      t.string :title
      t.string :phone
      t.string :address

      t.timestamps
    end
  end
end
