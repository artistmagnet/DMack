class CreateRtableItems < ActiveRecord::Migration
  def change
    create_table :rtable_items do |t|
      t.integer :rtable_id
      t.integer :position
      t.string :values, :array => true
    end
  end
end
