class DirectorInvitationsController < InvitationsController
  before_action :set_production

  def index
    @production = Production.find(params[:production_id])
    puts @production.nil? ? "NIL prod" : "Prod: #{@production.to_json}"
    @invitations = Invitation.where(to: @production).order(:last_name)
    @invitation = DirectorInvitation.new()
    #TODO: set current user as sender
    # @invitation = DirectorInvitation.new(to_id: @production.id, by: User.first)
  end

  def create
    @invitation = DirectorInvitation.new(invitation_params)
    @invitation.to      = @production
    @invitation.by      = User.first
    respond_to do |format|
      if @invitation.save
        # invite_director
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
end
