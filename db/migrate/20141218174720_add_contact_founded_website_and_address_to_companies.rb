class AddContactFoundedWebsiteAndAddressToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :website, :string
    add_column :companies, :primary_contact_email, :string
    add_column :companies, :primary_contact_phone, :string
    add_column :companies, :year_founded, :integer
    add_column :companies, :address1, :string
    add_column :companies, :address2, :string
    add_column :companies, :city, :string
    add_column :companies, :state, :string
    add_column :companies, :country, :string
  end
end
