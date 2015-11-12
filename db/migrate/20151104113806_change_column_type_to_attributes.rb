class ChangeColumnTypeToAttributes < ActiveRecord::Migration
  def change
  	change_column :attributes,:height,:string
  	change_column :attributes,:weight,:string
  	change_column :attributes,:hair_lenght,:string
  end
end
