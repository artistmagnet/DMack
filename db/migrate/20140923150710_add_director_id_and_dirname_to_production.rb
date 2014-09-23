class AddDirectorIdAndDirnameToProduction < ActiveRecord::Migration
  def change
    add_column :productions, :director_id, :integer
    add_column :productions, :dirname, :string
    add_column :productions, :diremail, :string
  end
end
