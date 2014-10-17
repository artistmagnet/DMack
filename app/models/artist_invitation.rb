class ArtistInvitation < Invitation

  belongs_to :to, :polymorphic => true

  def self.emails
    ArtistInvitation.all.select{|invitation| invitation.email}
  end

end
