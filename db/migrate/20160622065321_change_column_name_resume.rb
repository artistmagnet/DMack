class ChangeColumnNameResume < ActiveRecord::Migration
  def change
  	rename_column :resumes, :type, :int_type
  end
end
