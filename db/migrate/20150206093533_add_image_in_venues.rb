class AddImageInVenues < ActiveRecord::Migration
  def self.up
    add_attachment :venues, :image
  end

  def self.down
    remove_attachment :venues, :image
 end
end
