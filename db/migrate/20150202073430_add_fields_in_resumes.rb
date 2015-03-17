class AddFieldsInResumes < ActiveRecord::Migration
  def change
  	add_column :resumes,:resume_type,:string
  	add_column :resumes,:skills,:string
  	add_column :resumes,:other,:text
  end
end
