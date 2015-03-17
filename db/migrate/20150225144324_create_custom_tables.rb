class CreateCustomTables < ActiveRecord::Migration
  def change
    create_table :custom_tables do |t|

      t.timestamps
    end
  end
end
