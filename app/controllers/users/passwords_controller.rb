class Users::PasswordsController < Devise::PasswordsController
  prepend_before_action :check_captcha, only: [:create]

  private
  
    def check_captcha
      if verify_recaptcha
        true
      else
        self.resource = resource_class.send_reset_password_instructions(resource_params)
        respond_with(resource)
      end 
    end
end