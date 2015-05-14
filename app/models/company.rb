class Company < ActiveRecord::Base
  has_many :productions
  has_many :theatres
  has_many :simple_invitations, :as => :to

  #validates :name, :uniqueness => true
  validate :validate_properties
  validates :email, :primary_contact_email, :email => true
  validates :website, :addr_fb, :addr_tw, uri: true
  has_many :photos, as: :imageable

  def validate_properties
    if name.blank?
      errors.add :name, "is required"
    end

    if primary_contact_name.blank?
      errors.add :primary_contact_name, "is required"
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
  end


  def name_with_city
    city.blank? ? name : [name, city].join(', ')
  end

  # def city
  #   productions.each do |production|
  #     return production.city unless production.city.nil?
  #   end
  # end

end
