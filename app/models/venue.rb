class Venue < ActiveRecord::Base
  has_many :shows
  has_many :productions, :through => :shows

  validate :validate_properties

  def validate_properties
    if name.blank?
      errors.add :name, "is required"
    end

    if city.blank?
      errors.add :city, "is required"
    end

    if state.blank?
      errors.add :state, "is required"
    end

    if country.blank?
      errors.add :country, "is required"
    end
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


end
