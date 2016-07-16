class AmMailer < ActionMailer::Base
  default from: "#{ENV['EMAIL_SENDER_ADDRESS'] || 'manish@artistmagnet.com'}" #'dev@artistmagnet.com'}"

  def invite_director(invitation, production, referrer_name, stage_name)
    @invitation = invitation
    @production = production
    @referrer_name = referrer_name
    @stage_name = stage_name
    mail(to: @invitation.email, subject: "#{referrer_name}\'s Résumé on Artist Magnet")
  end

  def invite_artist(invitation, related_entity, referrer_name, artist_name)
    @invitation = invitation
    @related_entity = related_entity
    @referrer_name = referrer_name
    @artist_name = artist_name
    mail(to: @invitation.email, subject: "#{referrer_name}\'s Résumé on Artist Magnet")
  end
end
