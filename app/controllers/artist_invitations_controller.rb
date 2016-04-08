class ArtistInvitationsController < InvitationsController
  before_action :set_to
  before_action :set_invitations
  # before_action :set_role
  def index
    @invitation  = ArtistInvitation.new()
  end

  def create
    @invitation = ArtistInvitation.new(invitation_params)
    @invitation.to      = @to
    @invitation.by      = User.first
    respond_to do |format|
      if @invitation.save
        # invite_artist
        send_artist_invitation @invitation
        format.html {redirect_to :back, notice: "Congratulations, your message has been sent to #{@invitation.first_name} #{@invitation.last_name}"}
        format.json {render json: @invitation}
      else
        format.html {render :index}
        format.json {render json: @invitation.errors.full_messages, status: :unprocessable_entity}
      end
    end
  end


  private

  def set_to
    @to ||= Production.find(params[:production_id]) unless params[:production_id].blank?
    @to ||= Company.find(params[:company_id]) unless params[:company_id].blank?
    @to ||= Venue.find(params[:venue_id]) unless params[:venue_id].blank?
    @to ||= User.find(params[:user_id]) unless params[:user_id].blank?
  end

  def set_invitations
    @invitations = ArtistInvitation.where(to: @to).order(:last_name)
  end

  # def set_role
  #   @role = Role.new(production: @production)
  # end

  def invitation_params
    artist_invitation_params
  end

  def artist_invitation_params
    params.require(:artist_invitation).permit(:first_name, :last_name, :email, :text)
  end

  def send_artist_invitation(invitation)
    production = invitation.to
    puts "Sending artist invitation"
    AmMailer.invite_artist(invitation, production, 'An Artist Magnet user').deliver
  end
end
