class AmMailer < ActionMailer::Base
  default from: "#{ENV['EMAIL_SENDER_ADDRESS'] || 'dev@artistmagnet.com'}"

  def invite_director(invitation, production, referrer_name)
    @invitation = invitation
    @production = production
    @referrer_name = referrer_name
    mail(to: @invitation.email, subject: "#{referrer_name} invited you to Artist Magnet")
  end
end
