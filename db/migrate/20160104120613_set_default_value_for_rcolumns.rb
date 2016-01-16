class SetDefaultValueForRcolumns < ActiveRecord::Migration
  def change
  	change_column :representations,:rcolumns,:text,:default => ""
  end
end
