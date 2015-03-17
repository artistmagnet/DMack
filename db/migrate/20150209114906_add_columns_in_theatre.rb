class AddColumnsInTheatre < ActiveRecord::Migration
  def change
  	add_column :theatres, :production,:string
  	add_column :theatres, :venue,:string
  	add_column :theatres, :company,:string
  end
end
