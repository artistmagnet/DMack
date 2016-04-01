class RegistrationsController < Devise::RegistrationsController
  prepend_before_action :check_captcha, only: [:create]
  
  def create
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up, email: resource.email if is_flashing_format?
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
    
    
    # @user= User.new(user_params)
    # # if simple_captcha_valid?     
    #   respond_to do |format|
    #     if @user.save
    #       #UserMailer.welcome_email(@user, params[:user][:password]).deliver
    #       format.html { redirect_to authenticated_root_path, notice: "Thank you, a confirmation email has been sent to #{@user.email}." }
    #       format.json { render :show, status: :created, location: @user }
    #     else
    #       format.html { render :new }
    #       format.json { render json: @user.errors, status: :unprocessable_entity }
    #     end
    #   end
    # else      
    #   flash[:error] = "There was an error with the captcha code below. Please re-enter the code and click Sign Up."
    #   render :new
    # end
  end

  protected
    def update_resource(resource, params)
      resource.update_without_password(params)
    end
  
  private
    def check_captcha
      if verify_recaptcha
        true
      else
      # byebug
        self.resource = resource_class.new sign_up_params
        respond_with_navigational(resource) { render :new }
      end 
    end
end 