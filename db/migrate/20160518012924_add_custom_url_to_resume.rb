class AddCustomUrlToResume < ActiveRecord::Migration
  def change
    add_column :resumes, :custom_url, :string
  end
end
