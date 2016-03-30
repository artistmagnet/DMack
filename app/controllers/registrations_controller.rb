class RegistrationsController < Devise::RegistrationsController
  prepend_before_action :check_captcha, only: [:create]
  
  def new
    super
  end

  def create
    @user= User.new(params[:user].permit!)
    # if simple_captcha_valid?     
      respond_to do |format|
        if @user.save
          #UserMailer.welcome_email(@user, params[:user][:password]).deliver
          format.html {  redirect_to root_url,notice: "Welcome Email has beed sent your email #{@user.email}." }
          format.json { render :show, status: :created, location: @user }
        else
          format.html { render :new }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    # else      
    #   flash[:error] = "There was an error with the captcha code below. Please re-enter the code and click Sign Up."
    #   render :new
    # end
  end

  def update
    super
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
        self.resource = resource_class.new sign_up_params
        respond_with_navigational(resource) { render :new }
      end 
    end
 
end 