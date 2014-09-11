class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :zipcode
      t.string :state
      t.string :country
      t.text :description

      t.timestamps
    end
  end
end
