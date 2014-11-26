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
  end


  def name_with_city
    city.blank? ? name : [name, city].join(', ')
  end

  def city
    productions.each do |production|
      return production.city unless production.city.nil?
    end
  end

end
