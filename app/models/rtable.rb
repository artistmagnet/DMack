class Rtable < ActiveRecord::Base
  has_one  :section_slot, :as => 'section', :dependent => :destroy
  has_many :rtable_items
  # has_one :resume, :through => :section_slot
  belongs_to :resume
end
