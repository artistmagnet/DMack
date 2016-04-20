class DirectorInvitation < Invitation
  belongs_to :to, :polymorphic => true

  validate :first_or_last

  def first_or_last
    if self.first_name.empty? && self.last_name.empty?
      errors.add(:base, "You must enter at least a First or Last Name")
    end
  end
 

  def initialize(attributes={})
    super(attributes)
    # to_type = 'Production'
  end

  def self.emails
    DirectorInvitation.all.select{|invitation| invitation.email}
  end

end
