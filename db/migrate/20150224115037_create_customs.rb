class CreateCustoms < ActiveRecord::Migration
  def change
    create_table :customs do |t|
			t.integer :resume_id
      t.string :custom1
      t.string :custom2
      t.string :custom3
      t.string :custom4
      t.string :custom5
      t.string :custom6
      t.integer :position
      
      t.timestamps
    end
  end
end
