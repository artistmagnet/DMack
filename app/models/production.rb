class Production < ActiveRecord::Base
  belongs_to :company
  belongs_to :director, :class_name => 'Resume'
  has_many :shows, dependent: :destroy
  has_many :venues, :through => :shows
  has_many :roles, dependent: :destroy
  has_many :resumes, :through => :roles
  has_many :artist_invitations, :as => :to
  has_many :director_invitations, :as => :to
  has_many :theatres

  accepts_nested_attributes_for :shows, allow_destroy: true, reject_if: :all_blank
  # accepts_nested_attributes_for :director_invitations, allow_destroy: true
  # accepts_nested_attributes_for :artist_invitations, allow_destroy: true

  validate :validate_properties
  validates :name, :presence => true
  validates :name, :uniqueness => true
  # delegate :name, :to => :director, :prefix => true
  #delegate :name, :to => :company, :prefix => true

  def company_name
    company.nil? ? "" : company.name
  end

  def key_info
    info = name
    info += ' - - - ' + company_name unless company_name.blank?
    info += ', ' + year if year
    info
  end

  def year
    od = opening_show.date
    od.try(:year).to_s
    # Show.where(production_id: id).minimum("date").year.to_s
  end

  def opening_date
    (show = opening_show) ? masked_date(show.date, show.opening_date_mask) : nil
  end

  def masked_date(date, mask)
    case mask
      when 7
        #date.to_formatted_s(:long)
        created_at.to_formatted_s(:month_and_year)
      when 6
        #date.to_formatted_s(:month_and_year)
        created_at.to_formatted_s(:month_and_year)
        # date.month + ', ' + date.year
      when 4
        #date.to_formatted_s(:year)
        created_at.to_formatted_s(:year)
        # date.year
      else
        ''
    end
  end

  def opening_show
    # puts "Prod ##{id} has #{shows.count} shows"
    #shows.order("date ASC").first #if current_venue
    shows.order("created_at ASC").first #if current_venue
  end


  def validate_properties
    if name.blank?
      errors.add :name, "is required"
    end

    # if !company.nil? && !company.valid?
    #   errors.add :company, "is invalid"
    # end
    #
    # if !shows[0].venue.nil? && !shows[0].valid?
    #   errors.add :opening_date, "is invalid. Please enter at least the year"
    # end

    # if !shows[0].venue.nil? && !shows[0].valid?
    #   errors.add :premiere_info, "is invalid"
    # end

    if company.nil? && shows[0].venue.nil?
      puts "COMPANY: #{company.to_json}"
      errors.add :company_and_venue, "are blank. Please provide at least one"
    end

    # director_invitation = last_director_invitation
    # puts "Invitation #{director_invitation.nil? ? 'had NOT been initialized' : 'had been initialized'}"
    # if director_id.blank?
    #   puts "NO AM director"
    #   if director_invitation && invitation_filled?(director_invitation) && !good_for_production(director_invitation)
    #     errors.add "Director's contact info", "is invalid"
    #   end
    # else
    #   # unless director_invitations.empty?
    #     puts "resetting last dir inv"
    #     director_invitations[director_invitations.size-1] = Invitation.new
    #   # end
    # end
  end

  def current_venue
    venues.first
  end

  def current_venue_name
    current_venue ? current_venue.name : ""
  end

  def city
    current_venue.city if current_venue
  end

  def staging_period_at(venue)
    shows = Show.where(production: self, venue: venue).order(:date)
    case shows.count
      when 0
        'Not featured'
      when 1
        #shows.first.date.to_formatted_s(:long)
        shows.first.created_at.to_formatted_s(:long)
      else
        #[shows.first.date.to_formatted_s(:compact), shows.last.date.to_formatted_s(:compact)].join(' - ')
        [shows.first.created_at.to_formatted_s(:compact), shows.last.created_at.to_formatted_s(:compact)].join(' - ')
    end
  end

  def director_name
    return director.name if director_id
    return last_director_invitation.try(:full_name)
  end


  def last_director_invitation
    director_invitations.last
  end

  # def set_director_inviter(user)
  #   inv = last_director_invitation
  #   if inv
  #     inv.by = user
  #     inv.save
  #   end
  # end

  # def invitation_filled? (invitation)
  #   res = !(invitation.first_name.blank? && invitation.last_name.blank? & invitation.email.blank?)
  #   puts "Dir. inv. #{res ? '' : 'NOT'} filled"
  #   res
  # end
  #
  # private
  #
  # def good_for_production(invitation)
  #   res = (!invitation.first_name.blank? && !invitation.last_name.blank? && invitation.email =~ /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i  )
  #   puts "Dir. inv. #{res ? '' : 'NOT'}good for prod"
  #   res
  # end

end
