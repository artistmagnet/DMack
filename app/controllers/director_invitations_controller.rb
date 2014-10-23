class DirectorInvitationsController < InvitationsController
  before_action :set_production

  def index
    @invitations = DirectorInvitation.where(to: @production).order(:last_name)
    @invitation = DirectorInvitation.new()
  end

  def create
    @invitation = DirectorInvitation.new(invitation_params)
    @invitation.to      = @production
    @invitation.by      = User.first
    respond_to do |format|
      if @invitation.save
        # invite_director
        send_director_invitation @invitation
        format.html {redirect_to production_director_invitations_path(@production), notice: "Invitation has been sent"}
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

  def invitation_params
    director_invitation_params
  end

  def director_invitation_params
    params.require(:director_invitation).permit(:first_name, :last_name, :email, :text)
  end

  def send_director_invitation(invitation)
    production = invitation.to
    # if production.director_invitations.where(email: inv.email, by: inv.by).count > 1
    #   puts "Duplicate director invitation - INGORING"
    #   puts production.director_invitations.where(email: inv.email, by: inv.by).to_json
    # else
      puts "Sending director invitation"
      AmMailer.invite_director(invitation, production, 'An Artist Magnet user').deliver
    # end
  end
end
