class ArtistInvitationsController < InvitationsController
  before_action :set_production
  before_action :set_invitations
  before_action :set_role
  def index
    @invitation  = ArtistInvitation.new()
  end

  def create
    @invitation = ArtistInvitation.new(invitation_params)
    @invitation.to      = @production
    @invitation.by      = User.first
    respond_to do |format|
      if @invitation.save
        # invite_artist
        send_artist_invitation @invitation
        format.html {redirect_to production_artist_invitations_path(@production), notice: "Invitation has been sent"}
        format.json {render json: @invitation}
      else
        format.html {render :index}
        format.html {render json: @invitation.errors.full_messages, status: :unprocessable_entity}
      end
    end
  end


  private

  def set_production
    @production = Production.find(params[:production_id])
  end

  def set_invitations
    @invitations = ArtistInvitation.where(to: @production).order(:last_name)
  end

  def set_role
    @role = Role.new(production: @production)
  end

  def invitation_params
    artist_invitation_params
  end

  def artist_invitation_params
    params.require(:artist_invitation).permit(:first_name, :last_name, :email, :text, :role)
  end

  def send_artist_invitation(invitation)
    production = invitation.to
    puts "Sending artist invitation"
    AmMailer.invite_artist(invitation, production, 'An Artist Magnet user').deliver
  end
end
