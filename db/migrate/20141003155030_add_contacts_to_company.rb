class AddContactsToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :email, :string
    add_column :companies, :phone, :string
    add_column :companies, :addr_fb, :string
    add_column :companies, :addr_tw, :string
    add_column :companies, :addr_ins, :string
    add_column :companies, :addr_lin, :string
  end
end
