class RemoveImageFromVenue < ActiveRecord::Migration
  def change
  	remove_attachment :venues,:image
  end
end
