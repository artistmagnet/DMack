class Resume < ActiveRecord::Base
  belongs_to :user
  has_many :roles, dependent: :destroy
  has_many :productions, :through => :roles

  accepts_nested_attributes_for :roles, allow_destroy: true, reject_if: :all_blank
  delegate :name, :to => :user, :prefix => true

  validate :validate_resumes


  def validate_resumes
    if !roles[0].valid?
      # errors.clear
      errors.add(:role_name, roles[0].errors[:name].first)
    end
  end

end
