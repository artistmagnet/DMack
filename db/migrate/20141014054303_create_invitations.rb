class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :state
      t.string :text
      # t.type :string
      t.references :to, polymorphic: true

      t.timestamps
    end
  end
end
