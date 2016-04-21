class AddResumeIdToInvitation < ActiveRecord::Migration
  def change
    add_column :invitations, :resume_id, :integer
  end
end
