class CreateRtables < ActiveRecord::Migration
  def change
    create_table :rtables do |t|
      t.string :title
      t.string :columns, array: true, default: []
      t.integer :positions, array: true, default: []
      t.string :type

      t.timestamps
    end
  end
end
