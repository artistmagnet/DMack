class AddPositionInNestedTables < ActiveRecord::Migration
  def change
  	add_column :educations,:position,:integer
  	add_column :representations,:position,:integer
  	add_column :skills,:position,:integer
  	add_column :contact_infos,:position,:integer
  	add_column :attributes,:position,:integer
  end
end
