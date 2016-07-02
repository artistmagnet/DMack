class Venue < ActiveRecord::Base
  has_many :shows
  has_many :productions, :through => :shows
  has_many :simple_invitations, :as => :to
  has_many :theatres,foreign_key: :venue
  validate :validate_properties
  validates :name, :uniqueness => true
  #has_many :photos, as: :imageable
  has_one :photo, as: :imageable, dependent: :destroy
  has_many :invitations,:as => :to

  accepts_nested_attributes_for :photo,:allow_destroy => true, reject_if: :all_blank
  #validates :email, :primary_contact_email, :email => true
  #validates :addr_fb, :addr_tw, :website, uri: true
  # validates :addr_fb, :addr_tw, :addr_ins, :addr_lin, uri: true
  # has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/fallback/union_station-180.png"
  # validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  accepts_nested_attributes_for :simple_invitations, allow_destroy: true


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

  end
  def image_url
    self.image.url(:medium)
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
