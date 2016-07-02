class HomeController < ApplicationController

  def index
    @to ||= current_user
    @invitation =ArtistInvitation.new
    if current_user
      @fb_friends = User.get_facebook_friends(current_user) unless current_user.authentications.blank?
    end

    greetings = ["Hello", "Welcome back", "Hi", "Hey"]
    number = DateTime.now.to_time.to_i
    index = Random.new(number).rand(greetings.size)
    @greeting = greetings[index]
  end
  
  def about
  end
  def faq
  end
  def terms_adn_conditions
  end
  def privacy
  end
  def contact
  end
  def copyright
  end

  def paypal_url
    
  end
end
