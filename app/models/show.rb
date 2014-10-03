class Show < ActiveRecord::Base
  belongs_to :venue
  belongs_to :production

  delegate :name, :to => :production, :prefix => true
  # delegate :staging_period_at, :to => :production, :prefix => true

  def venue_name
    venue.nil? ? "Unknown" : venue.name
  end

  validate :validate_properties

  def validate_properties
    if venue_name.blank?
      errors.add :venue_name, "is invalid"
    end
  end
end
