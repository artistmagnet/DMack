class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.integer :resume_id
      t.string :school
      t.string :city
      t.string :state
      t.string :country
      t.string :degree
      t.integer :year

      t.timestamps
    end
  end
end
