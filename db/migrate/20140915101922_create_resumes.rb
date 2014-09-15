class CreateResumes < ActiveRecord::Migration
  def change
    create_table :resumes do |t|
      t.integer :type
      t.integer :user_id

      t.timestamps
    end
  end
end
