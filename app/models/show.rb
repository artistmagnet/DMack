class Show < ActiveRecord::Base
  belongs_to :venue
  belongs_to :production

  delegate :name, :to => :venue, :prefix => true
  delegate :name, :to => :production, :prefix => true

  validate :validate_properties

  def validate_properties
    if venue_name.blank?
      errors.add :venue_name, "is invalid"
    end

  end
end
