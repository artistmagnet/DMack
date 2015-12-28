class ChangeColumnTypeInRepresentation < ActiveRecord::Migration
  def change
  	remove_column :representations,:is_bold
  	change_column :representations,:rcolumns,:text
  	remove_column :representations,:company
  	remove_column :representations,:contact_name
  	remove_column :representations,:title
  	remove_column :representations,:phone
  	remove_column :representations,:address
  	drop_table :representation_tables
  end
end
