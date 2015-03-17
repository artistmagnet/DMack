class CreateAttributes < ActiveRecord::Migration
  def change
    create_table :attributes do |t|
      t.integer :resume_id
      t.string :gender
      t.string :age
      t.float :height
      t.float :weight
      t.string :hair_color
      t.float :hair_lenght
      t.string :eye_color
      t.string :vocal_range
      t.string :ethnicity

      t.timestamps
    end
  end
end
