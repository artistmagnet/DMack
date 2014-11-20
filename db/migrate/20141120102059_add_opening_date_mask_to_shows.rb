class AddOpeningDateMaskToShows < ActiveRecord::Migration
  def change
    add_column :shows, :opening_date_mask, :integer, default: 7
  end
end
