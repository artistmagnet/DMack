class AddSectionIdToResumeSection < ActiveRecord::Migration
  def change
  	add_column :resume_sections,:section_id,:integer
  end
end
