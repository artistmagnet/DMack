class SectionSlot < ActiveRecord::Base
  belongs_to :section, :polymorphic => true
  belongs_to :resume

end
