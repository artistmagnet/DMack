class Rtable < ActiveRecord::Base
  has_one  :section_slot, :as => 'section'
  has_many :rtable_items
end
