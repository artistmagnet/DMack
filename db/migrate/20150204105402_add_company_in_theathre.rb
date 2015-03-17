class AddCompanyInTheathre < ActiveRecord::Migration
  def change
  	add_column :theatres,:company,:string
  end
end
