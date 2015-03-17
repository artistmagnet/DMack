class UsersController < ApplicationController

  before_action :set_user,only: [:show]
  def index
    @users = User.all.order(:email)
  end
  def oauth_login    
    $fb_friends=nil
    user = User.from_omniauth(env["omniauth.auth"])
    if !current_user
      sign_in user
      redirect_to root_url
    else      
      $fb_friends = User.get_facebook_friends(user) if !user.authentications.blank?
      redirect_to :back       
    end    
  end

  def add_friends
  end

  def show
  end

   def express
    price_in_cents = 9.99 * 100
    response = EXPRESS_GATEWAY.setup_purchase(10,
      :ip                => request.remote_ip,
      :return_url        => ENV['BASE_URL'],
      :cancel_return_url => ENV['BASE_URL']
    )
    redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token)
   end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email)
    end
end
