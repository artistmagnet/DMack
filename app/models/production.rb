class Production < ActiveRecord::Base
  belongs_to :company
  belongs_to :director, :class_name => :user
  has_many :shows, dependent: :destroy
  has_many :venues, :through => :shows
  has_many :roles, dependent: :destroy
  has_many :resumes, :through => :roles
  has_many :artist_invitations, :as => :to
  has_many :director_invitations, :as => :to

  accepts_nested_attributes_for :shows, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :director_invitations, allow_destroy: true
  accepts_nested_attributes_for :artist_invitations, allow_destroy: true

  validate :validate_properties

  delegate :name, :to => :director_name, :prefix => true
  delegate :name, :to => :company, :prefix => true

  def company_name
    company.nil? ? "" : company.name
  end

  def key_info
    info = name + ' - - - ' + company_name + ', ' + year
  end

  def year
    Show.where(production_id: id).minimum("date").year.to_s
  end

  def opening_date
    Show.where(production_id: id, venue_id: current_venue.id).minimum("date").to_formatted_s(:long) if current_venue
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

    # puts "Show #{shows[0].nil? ? 'does NOT exist' : 'exists'}"
    if !shows[0].venue_id.blank? && !shows[0].valid?
      errors.add :premiere_info, "is invalid"
    end

    if company_id.blank? && shows[0].venue_id.blank?
      errors.add :company_and_venue, "are blank. Please provide at least one"
    end

    director_invitation = last_director_invitation
    puts "Invitation #{director_invitation.nil? ? 'does NOT exist' : 'exists'}"
    if director_id.blank?
      puts "NO AM director"
      if director_invitation && invitation_filled?(director_invitation) && !good_for_production(director_invitation)
        errors.add "Director's contact info", "is invalid"
      end
    else
      unless director_invitations.empty?
        puts "resetting last dir inv"
        director_invitations[director_invitations.size-1] = Invitation.new
      end
    end

  end

  def current_venue
    venues.first
  end

  def current_venue_name
    current_venue ? current_venue.name : ""
  end

  def staging_period_at(venue)
    shows = Show.where(production: self, venue: venue).order(:date)
    case shows.count
      when 0
        'Not featured'
      when 1
        shows.first.date.to_formatted_s(:long)
      else
        [shows.first.date.to_formatted_s(:compact), shows.last.date.to_formatted_s(:compact)].join(' - ')
    end
  end

  def director_name
    return director.full_name if director
    return last_director_invitation.try(:full_name)
  end


  def last_director_invitation
    director_invitations.last
  end

  def set_director_inviter(user)
    inv = last_director_invitation
    if inv
      inv.by = user
      inv.save
    end
  end

  private

  def invitation_filled? (invitation)
    !(invitation.first_name.blank? && invitation.last_name.blank? & invitation.email.blank?)
  end

  def good_for_production(invitation)
    !invitation.first_name.blank? && !invitation.last_name.blank? && invitation.email =~ /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
  end

end
