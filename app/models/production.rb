class Production < ActiveRecord::Base
  belongs_to :company
  has_many :shows, dependent: :destroy
  has_many :venues, :through => :shows
  has_many :roles, dependent: :destroy
  has_many :resumes, :through => :roles

  accepts_nested_attributes_for :shows, allow_destroy: true, reject_if: :all_blank
  delegate :name, :to => :company, :prefix => true

  validate :validate_properties


  def validate_properties
    if company.nil? || !company.valid?
      errors.add :company, "is invalid"
    end

    if name.blank?
      errors.add :name, "is required"
    end

    if description.blank?
      errors.add :description, "is required"
    end

    if !shows[0].valid?
      errors.add :premiere_info, "is invalid"
    end
  end

  def current_venue
    venues.first
  end

  def current_venue_name
    current_venue.name
  end
end
