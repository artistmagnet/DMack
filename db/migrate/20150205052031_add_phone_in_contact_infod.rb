class AddPhoneInContactInfod < ActiveRecord::Migration
  def change
  	add_column :contact_infos,:phone1,:string
  	add_column :contact_infos,:phone2,:string
  end
end
