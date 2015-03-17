class AddResumeIdToRtable < ActiveRecord::Migration
  def change
  	add_column :rtables, :resume_id, :integer
  end
end
