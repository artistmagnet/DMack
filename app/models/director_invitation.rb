class DirectorInvitation < Invitation
  belongs_to :to, :polymorphic => true

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  

  def initialize(attributes={})
    super(attributes)
    # to_type = 'Production'
  end

  def self.emails
    DirectorInvitation.all.select{|invitation| invitation.email}
  end

end
