class AddContactsToVenue < ActiveRecord::Migration
  def change
    add_column :venues, :email, :string
    add_column :venues, :phone, :string
    add_column :venues, :addr_fb, :string
    add_column :venues, :addr_tw, :string
    add_column :venues, :addr_ins, :string
    add_column :venues, :addr_lin, :string
  end
end
