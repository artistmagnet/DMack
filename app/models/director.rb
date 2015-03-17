class Director < ActiveRecord::Base
	has_many :theatres,foreign_key: :directed_by
	validates :name,:presence => true
end
