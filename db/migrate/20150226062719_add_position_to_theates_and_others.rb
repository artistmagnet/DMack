class AddPositionToTheatesAndOthers < ActiveRecord::Migration
  def change
  	add_column :theatres, :position,:integer  	
  end
end
