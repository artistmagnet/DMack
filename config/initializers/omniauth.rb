OmniAuth.config.logger = Rails.logger

if Rails.env == 'development' || Rails.env == 'test'
  Rails.application.config.middleware.use OmniAuth::Builder do    
    provider :facebook, ENV['DEV_FACEBOOK_KEY'], ENV['DEV_FACEBOOK_SECRET'], :scope => 'email,publish_actions,read_stream', :display => 'page'
  end

else
  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'], :scope => 'email,publish_actions,read_stream', :display => 'popup'
  end
end

# OmniAuth.config.logger = Rails.logger

# Rails.application.config.middleware.use OmniAuth::Builder do
#   #procution
#   # provider :facebook, '264261863720887', '410fbf3b03164fd96d1a7f12b543755c'
#   #localhost
#  # provider :facebook, '1362814753857308', '0d881f7abaa1643196457a3a4002a25b'
#    #provider :facebook, '250567875131710', 'e085d798a18b8b480fb224beb4d96f8f'
#    # provider :linkedin, '75y5qkap5967t8', 'XLbNPKxHe5tY7dln'
#    provider :facebook, '1614452768776971', '80031769a55bae8c14d9587b41003d8a'
#    #provider :facebook, '1469135396664519', 'e0fe834d79ef3ddd75be16d15b8c2294'
#    #provider :google_oauth2, "681977164650-m3kpfbessdckplif3giknhub1r02d871.apps.googleusercontent.com", "WgRy7sHUknsmEMStB_g62ih9"
#    #//vivek//#provider :google_oauth2, "209187761234-vg6c47mnb5pnea20das38tlckpuvg68l@developer.gserviceaccount.com", "JOdB9p1cz2UZAAOurlrSjpxf"
#    # provider :google_oauth2, "681977164650-m3kpfbessdckplif3giknhub1r02d871.apps.googleusercontent.com", "WgRy7sHUknsmEMStB_g62ih9"
# end	
