class Company < ActiveRecord::Base
  has_many :productions


  validate :validate_properties
  validates :email, :email => true
  validates :addr_fb, :addr_tw, :addr_ins, :addr_lin, uri: true

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

    # uri_validator = UriValidator.new
    # if !addr_fb.blank? && !uri_validator.valid?(addr_fb)
    #   errors.add "Facebook page address", "must begin with 'http://' or 'https://'"
    # end
    # if !addr_tw.blank? && !uri_validator.valid?(addr_tw)
    #   errors.add "Twitter page address", "must begin with 'http://' or 'https://'"
    # end
    # if !addr_ins.blank? && !uri_validator.valid?(addr_ins)
    #   errors.add "Instagram page address", "must begin with 'http://' or 'https://'"
    # end
    # if !addr_lin.blank? &&!uri_validator.valid?(addr_lin)
    #   errors.add "LinkedIn page address", "must begin with 'http://' or 'https://'"
    # end

  end

end
