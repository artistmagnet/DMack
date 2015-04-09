class Theatre < ActiveRecord::Base	
	belongs_to :director
  belongs_to :venue_section, :foreign_key  => "venue", :class_name => "Venue" 
end
