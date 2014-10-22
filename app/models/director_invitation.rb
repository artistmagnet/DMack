class DirectorInvitation < Invitation

  belongs_to :to, :polymorphic => true

  def initialize(attributes={})
    super(attributes)
    # to_type = 'Production'
  end

  def self.emails
    DirectorInvitation.all.select{|invitation| invitation.email}
  end

end
