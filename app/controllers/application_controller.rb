class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  include SimpleCaptcha::ControllerHelpers

  before_action {@resumes = current_user.resumes if current_user}

  # def current_user
  #   User.all.first
  # end
    protected
	    def configure_permitted_parameters
        devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :dob, :gender, :email, :password, :password_confirmation, :remember_me, :member_role) }
        devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password) }
        devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name,:last_name,:dob,:gender,:email, :password,:password_confirmation,:member_role, :subscription, :member_type ) }	       
        devise_parameter_sanitizer.for(:accept_invitation) do |u|
          u.permit(:first_name, :last_name,:dob,:gender,:member_role, :password, :password_confirmation,
            :invitation_token)
        end  
      end
    
end
