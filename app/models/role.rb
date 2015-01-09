class Role < ActiveRecord::Base
  belongs_to :resume
  belongs_to :director, :class_name => 'Resume'
  belongs_to :production

  delegate :name, :to => :resume, :prefix => true
  delegate :name, :to => :production, :prefix => true
  delegate :current_venue, :to => :production, :prefix => true
  delegate :current_venue_name, :to => :production, :prefix => true
  delegate :company, :to => :production, :prefix => true
  delegate :company_name, :to => :production, :prefix => true
  delegate :director_name, :to => :production, :prefix => true

  validate :validate_properties

  scope :confirmed, -> { where("name <> ?", "N.A.") }

  def user
    resume.user
  end

  def user_name
    user.name
  end

  def director_name
    return dirname if dirname
    return director.name if director_id
    return production_director_name
  end

  def validate_properties
    if name.blank?
      errors.add :role, "is required"
    end
    # issues when submitted by new resumes
    # if resume_id.blank?
    #   errors.add :resume_id, "is invalid"
    # end
    if production_id.blank?
      errors.add :production_id, "is invalid"
    end
  end
end
