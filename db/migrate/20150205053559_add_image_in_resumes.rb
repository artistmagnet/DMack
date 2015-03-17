class AddImageInResumes < ActiveRecord::Migration
   def self.up
    add_attachment :resumes, :image
  end

  def self.down
    remove_attachment :resumes, :image
  end
end
