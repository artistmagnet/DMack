class Company < ActiveRecord::Base
  has_many :productions
  has_many :theatres
  has_many :simple_invitations, :as => :to

  #validates :name, :uniqueness => true
  validate :validate_properties
  validates :email, :primary_contact_email, :email => true
  validates :website, :addr_fb, :addr_tw, uri: true
  has_one :photo, as: :imageable, dependent: :destroy
  #has_many :photos, as: :imageable
  # has_one :photo, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :photo,:allow_destroy => true, reject_if: :all_blank
  # has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/fallback/union_station-180.png"
  # validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

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
