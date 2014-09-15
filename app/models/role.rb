class Role < ActiveRecord::Base
  belongs_to :resume
  belongs_to :production

  delegate :name, :to => :resume, :prefix => true
  delegate :name, :to => :production, :prefix => true

  validate :validate_properties

  def validate_properties
    if production_name.blank?
      errors.add :production_name, "is invalid"
    end
  end
end
