class AddColumnsToEducationAndTables < ActiveRecord::Migration
  def change
  	add_column :educations,:ecolumns, :string,array: true, default: []
  	add_column :educations,:is_bold, :boolean,{:default=>false}

  	add_column :representations,:rcolumns, :string,array: true, default: []
  	add_column :representations,:is_bold, :boolean,{:default=>false}

  	add_column :customs,:ccolumns, :string,array: true, default: []
  	add_column :customs,:is_bold, :boolean,{:default=>false}
  end
end
