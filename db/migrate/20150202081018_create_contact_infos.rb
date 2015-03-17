class CreateContactInfos < ActiveRecord::Migration
  def change
    create_table :contact_infos do |t|
      t.integer :resume_id
      t.string :nick_name
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :suffix
      t.string :street_address1
      t.string :street_address2
      t.string :city
      t.string :state
      t.integer :zip_code
      t.string :country
      t.string :email
      t.string :website
      t.string :facebook
      t.string :twitter
      t.string :linkedin

      t.timestamps
    end
  end
end
