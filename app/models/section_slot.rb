class SectionSlot < ActiveRecord::Base
  belongs_to :section, :polymorphic => true
  belongs_to :resume

  def self.edit_section_path(params)
    edit_education_table_path(params)
  end
end
