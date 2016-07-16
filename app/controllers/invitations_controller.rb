class InvitationsController < ApplicationController
  before_action :set_invitation, only: [:show, :edit, :destroy]
  #before_action :authenticate_user!
  before_action :set_to, only: [:index]

  def new
    @invitation = Invitation.new
    if current_user
      @fb_friends = User.get_facebook_friends(current_user) if !current_user.authentications.blank?
    end
    greetings = ["Hello", "Welcome back", "Hi", "Hey"]
    number = DateTime.now.to_time.to_i
    index = Random.new(number).rand(greetings.size)
    @greeting = greetings[index]
  end

  def create
    if !params[:email].blank?
         @invitation = invite_members
         flash[:notice]= "Invitation has been sent"
         redirect_to :back
    else
       @invitation = current_user.invitations.new(invitation_params)
       @invitation.resume_id = params[:resume_id]
       respond_to do |format|
         #@invitation.to = @user.id
        if @invitation.save
          @user = User.invite!(:email => @invitation.email, :first_name => @invitation.first_name, :last_name => @invitation.last_name)
          # invite_director
          format.html {redirect_to invitations_path, notice: "Invitation has been sent"}
          format.json {render json: @invitation}
        else
          format.html {render :new}
          format.json {render json: @invitation.errors.full_messages, status: :unprocessable_entity}
        end
      end
    end   
  end

  def update
    respond_to do |format|
      if @invitation.save
        format.html {redirect_to invitations_path, notice: "Invitation has been sent"}
        format.json {render json: @invitation}
      else
        format.html {render :new}
        format.html {render json: @invitation.errors.full_messages, status: :unprocessable_entity}
      end
    end
  end

  def index
    @to ||= current_user
    @invitation  = ArtistInvitation.new()    
    @invitations = current_user.invitations
    @fb_friends = User.get_facebook_friends(current_user) unless current_user.authentications.blank?
  end

  def destroy
    @invitation.destroy
    respond_to do |format|
      format.html { redirect_to invitations_url, notice: 'Invitation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_invitation
    @invitation = Invitation.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def invitation_params
    params.require(:invitation).permit(:name, :email, :state, :text,:first_name,:last_name)
  end

  # def deliver_invitation
  #   puts ("INVITATION SENT TO: #{@invitation.name} (#{@invitation.email}), state: #{@invitation.state}, text: #{@invitation.text}")
  # end
  def invite_members
    params[:email].each do |email|
      if !email.blank?
        @invitation = current_user.invitations.new(:email=>email)          
        @invitation.save
        @user = User.invite!(:email => @invitation.email)
      end
    end
    return @invitation
  end

  def set_to
    @to ||= Production.find(params[:production_id]) unless params[:production_id].blank?
    @to ||= Company.find(params[:company_id]) unless params[:company_id].blank?
    @to ||= Venue.find(params[:venue_id]) unless params[:venue_id].blank?
    @to ||= User.find(params[:user_id]) unless params[:user_id].blank?
  end
end
