class Invitation < ActiveRecord::Base
  #validates :first_name, :presence => true
  #validates :last_name, :presence => true
  validates :email,:presence => true, :email => true
  # validates :text, :presence => true
  validate :other_validations

  belongs_to :to, :polymorphic => true
  belongs_to :by, :class_name => "User"

  scope :directors, -> { where type: 'DirectorInvitation' }

  def other_validations
    previous = Invitation.find_by(by: by, email: email)
    if previous
      errors.add :base, "You have already invited this person"
    end

    already_joined = Invitation.find_by(email: email)
    if already_joined
      puts "FAILING email uniquess validation on this record: #{already_joined}"
      errors.add :base, "This person has already joined Artist Magnet"
    end
  end

  def full_name
    [first_name, last_name].join(' ')
  end

  def by_name
    by.nil? ? '' : by.name
  end

  def self.emails
    Invitation.all.select{|invitation| invitation.email}
  end

end
