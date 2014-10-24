class CreateSectionSlots < ActiveRecord::Migration
  def change
    create_table :section_slots do |t|
      t.integer :position
      t.integer :resume_id
      t.integer :section_id
      t.string  :section_type
      t.timestamps
    end
  end
end
