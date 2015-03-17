class RemoveColumnFromThreatras < ActiveRecord::Migration
  def change
  	remove_column :theatres, :production_id
  	remove_column :theatres, :venue_id
  	remove_column :theatres, :company_id
  end
end
