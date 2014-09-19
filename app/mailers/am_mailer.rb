class AmMailer < ActionMailer::Base
  default from: "#{ENV['EMAIL_SENDER_ADDRESS'] || 'dev@artistmagnet.com'}"

  def invite_director(name, email, referrer_name)
    @name = name
    @referrer_name = referrer_name
    mail(to: email, subject: "#{referrer_name} invited you to Artist Magnet")
  end
end
