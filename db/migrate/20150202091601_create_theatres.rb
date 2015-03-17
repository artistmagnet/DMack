class CreateTheatres < ActiveRecord::Migration
  def change
    create_table :theatres do |t|
      t.integer :resume_id
      t.string :production
      t.string :venue
      t.string :role
      t.string :directed_by
      t.date :performance_date
      t.string :location

      t.timestamps
    end
  end
end
