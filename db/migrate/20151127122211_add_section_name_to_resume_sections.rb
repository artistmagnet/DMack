class AddSectionNameToResumeSections < ActiveRecord::Migration
  def change
  	add_column :resume_sections,:section_name,:string
  end
end
