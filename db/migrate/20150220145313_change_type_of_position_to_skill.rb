class ChangeTypeOfPositionToSkill < ActiveRecord::Migration
  def change
  	change_column :skills,:position,:string
  end
end
