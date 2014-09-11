class CreateProductions < ActiveRecord::Migration
  def change
    create_table :productions do |t|
      t.string :name
      t.text :description
      t.references :company

      t.timestamps
    end
  end
end
