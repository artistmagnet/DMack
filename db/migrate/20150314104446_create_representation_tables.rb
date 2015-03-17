class CreateRepresentationTables < ActiveRecord::Migration
  def change
    create_table :representation_tables do |t|

      t.timestamps
    end
  end
end
