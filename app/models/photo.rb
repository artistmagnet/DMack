class Photo < ActiveRecord::Base
	belongs_to :user
	belongs_to :resume
	belongs_to :imageable, polymorphic: true	
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "../assets/blankUser.png"
    validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
    validates_attachment :image, :size => { :in => 0..250.kilobytes }
end
