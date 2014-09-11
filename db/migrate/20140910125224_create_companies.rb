class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :primary_contact_name
      t.text :description

      t.timestamps
    end
  end
end
