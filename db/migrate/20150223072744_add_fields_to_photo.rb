class AddFieldsToPhoto < ActiveRecord::Migration
  def change
  	add_column :photos, :imageable_id, :integer
  	add_column :photos, :imageable_type, :string
  end
end
