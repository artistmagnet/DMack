class DirectorInvitation < Invitation

  belongs_to :to, :polymorphic => true

  def self.emails
    DirectorInvitation.all.select{|invitation| invitation.email}
  end

end
