class Venue < ActiveRecord::Base
  has_many :shows
  has_many :productions, :through => :shows

  validate :validate_properties
  validates :email, :primary_contact_email, :email => true
  # validates :addr_fb, :addr_tw, :addr_ins, :addr_lin, uri: true

  def validate_properties
    if name.blank?
      errors.add :name, "is required"
    end

    if city.blank?
      errors.add :city, "is required"
    end

    if country == 'United States' && state.blank?
      errors.add :state, "is required"
    end

    if country.blank?
      errors.add :country, "is required"
    end
    #
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

  def current_production
    productions.first
  end

  def current_production_name
    current_production.name
  end

  def full_address
    res = address1
    res << " " + address2 unless address2.blank?
    res << " " + city
    res << ",   " + state
    res << " " + zipcode
  end

  def name_with_city
    [name, city].join(', ')
  end


end
