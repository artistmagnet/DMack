class Users::SessionsController < Devise::SessionsController
  prepend_before_filter :force_reset_session, only: :destroy

  private
  
    def check_captcha
      if verify_recaptcha
        true
      else
        self.resource = resource_class.send_reset_password_instructions(resource_params)
        respond_with(resource)
      end 
    end
    
    def force_reset_session
      reset_session
    end
end