class CreateOthers < ActiveRecord::Migration
  def change
    create_table :others do |t|
      t.text :content
      t.integer :resume_id
      t.integer :position

      t.timestamps
    end
  end
end
