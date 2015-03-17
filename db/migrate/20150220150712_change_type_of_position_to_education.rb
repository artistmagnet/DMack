class ChangeTypeOfPositionToEducation < ActiveRecord::Migration
  def change
  	change_column :educations,:position,:string
  end
end
