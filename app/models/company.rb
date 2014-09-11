class Company < ActiveRecord::Base
  has_many :productions


  validate :validate_properties


  def validate_properties
    if name.blank?
      errors.add :name, "is required"
    end

    if primary_contact_name.blank?
      errors.add :primary_contact_name, "is required"
    end

    if description.blank?
      errors.add :description, "is required"
    end
  end

end
