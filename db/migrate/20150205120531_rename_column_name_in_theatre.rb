class RenameColumnNameInTheatre < ActiveRecord::Migration
  def change
  	add_column :theatres,:production_id,:integer
  	add_column :theatres,:venue_id,:integer
  	add_column :theatres,:company_id,:integer
  	add_column :theatres,:director_id,:integer

  	remove_column :theatres, :production
  	remove_column :theatres, :venue
  	remove_column :theatres, :company
  end
end
