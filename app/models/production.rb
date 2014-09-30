class Production < ActiveRecord::Base
  belongs_to :company
  belongs_to :director, :class_name => :user
  has_many :shows, dependent: :destroy
  has_many :venues, :through => :shows
  has_many :roles, dependent: :destroy
  has_many :resumes, :through => :roles

  accepts_nested_attributes_for :shows, allow_destroy: true, reject_if: :all_blank
  delegate :name, :to => :director, :prefix => true

  validate :validate_properties

  def company_name
    company.nil? ? "Unknown" : company.name
  end

  def key_info
    info = name + ' - - - ' + company_name + ', ' + year
  end

  def year
    Show.where(production_id: id).minimum("date").year.to_s
  end


  def validate_properties

    if name.blank?
      errors.add :name, "is required"
    end

    if description.blank?
      errors.add :description, "is required"
    end

    if !company_id.blank? && !company.valid?
      errors.add :company, "is invalid"
    end

    if !shows[0].venue_id.blank? && !shows[0].valid?
      errors.add :premiere_info, "is invalid"
    end

    if company_id.blank? && shows[0].venue_id.blank?
      errors.add :company_and_venue, "are blank. Please provide at least one"
    end

  end

  def current_venue
    venues.first
  end

  def current_venue_name
    current_venue.name
  end
end