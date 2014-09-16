class Role < ActiveRecord::Base
  belongs_to :resume
  belongs_to :production

  delegate :name, :to => :resume, :prefix => true
  delegate :name, :to => :production, :prefix => true

  validate :validate_properties

  def validate_properties
    if name.blank?
      errors.add :name, "is invalid"
    end
    if resume_id.blank?
      errors.add :resume_id, "is invalid"
    end
    if production_id.blank?
      errors.add :production_id, "is invalid"
    end
  end
end
