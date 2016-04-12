class Director < ActiveRecord::Base
	has_many :theatres,foreign_key: :directed_by
	validates :name,:presence => true

	def name_with_email
    		if !email.nil? && !email.empty?
			return "#{name} - #{email}"
		else
			return "#{name}"
		end
  	end	

end
