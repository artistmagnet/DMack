class AddTextOnlyToDirector < ActiveRecord::Migration
  def change
    add_column :directors, :text_only, :boolean
  end
end
