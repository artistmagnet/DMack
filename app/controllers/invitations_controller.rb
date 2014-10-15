class InvitationsController < ApplicationController
  before_action :set_invitation, only: [:show, :edit, :update, :destroy]

  def new
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.new(invitation_params)
    respond_to do |format|
      if @invitation.save
        deliver_invitation
        format.html {redirect_to invitations_path, notice: "Invitation has been sent"}
        format.json {render json: @invitation}
      else
        format.html {render :new}
        format.html {render json: @invitation.errors.full_messages, status: :unprocessable_entity}
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
    @invitations = Invitation.all.order(:name)
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
    params.require(:invitation).permit(:name, :email, :text)
  end

  def deliver_invitation
    puts ("INVITATION SENT TO: #{@invitation.name} (#{@invitation.email}), state: #{@invitation.state}, text: #{@invitation.text}")
  end
end
