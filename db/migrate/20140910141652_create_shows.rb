class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.references :production
      t.references :venue
      t.date :date

      t.timestamps
    end
  end
end
