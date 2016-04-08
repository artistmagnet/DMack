class AddResumeIdToDirector < ActiveRecord::Migration
  def change
    add_column :directors, :resume_id, :integer
  end
end
