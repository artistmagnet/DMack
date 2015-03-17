class AddFieldsToUser < ActiveRecord::Migration
  def change
  	add_column :users,:first_name,:string
  	add_column :users,:last_name,:string
  	add_column :users,:dob,:date
  	add_column :users,:gender,:string
  	add_column :users,:member_type,:string
  end
end
