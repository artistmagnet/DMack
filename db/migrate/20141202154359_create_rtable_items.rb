class CreateRtableItems < ActiveRecord::Migration
  def change
    create_table :rtable_items do |t|
      t.string :values, array: true, default: []
      t.integer :position

      t.timestamps
    end
  end
end
