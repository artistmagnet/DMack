class UserMailer < ActionMailer::Base
  add_template_helper(ResumesHelper)
  default from: "#{ENV['EMAIL_SENDER_ADDRESS'] || 'dev@artistmagnet.com'}"

  def welcome_email(user)
    @user = user
    # @password  = password
    mail(to: @user.email, subject: 'Thank you for joining Artist Magnet')
  end

  def email_resume(user,resume)
  	@user = user
    @resume  = resume
    mail(to: @user.email, subject: 'Your Resume')
  end
end
