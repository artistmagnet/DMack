class AddInfoFieldsInResumes < ActiveRecord::Migration
  def change
  	add_column :resumes,:performer_type,:string
  	add_column :resumes,:union_guild,:string
  end
end
