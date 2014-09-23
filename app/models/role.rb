class Role < ActiveRecord::Base
  belongs_to :resume
  belongs_to :production

  delegate :name, :to => :resume, :prefix => true
  delegate :name, :to => :production, :prefix => true

  validate :validate_properties

  def user
    resume.user
  end

  def user_name
    user.name
  end

  def validate_properties
    if name.blank?
      errors.add :name, "is required"
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
