class AddContactAndFoundedToVenues < ActiveRecord::Migration
  def change
    add_column :venues, :website, :string
    add_column :venues, :primary_contact_name, :string
    add_column :venues, :primary_contact_email, :string
    add_column :venues, :primary_contact_phone, :string
    add_column :venues, :year_founded, :integer
  end
end
