class User < ActiveRecord::Base
  has_many :resumes
  has_many :invitations,foreign_key: :by_id
  has_many :authentications
  has_many :orders
  has_many :photos
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :invitable

  def name
    email.sub(/@.*/, '')
  end

  def full_name
    name
  end

  def self.sorted_names_including_invited
    self.names_including_invited.sort
  end
  

  def self.from_omniauth(auth)
    authorization = Authentication.where(:provider => auth.provider, :uid => auth.uid.to_s).first_or_initialize
    if authorization.user.blank?
      user = where(email: auth.info.email).first_or_create
      user.email = auth.info.email
      user.first_name =  auth.info.first_name
      user.last_name =  auth.info.last_name
      user.password = Devise.friendly_token[0,10]
      user.save!
      authorization.user_id = user.id
      authorization.token = auth["credentials"]["token"]
      authorization.token_secret =  auth["credentials"]["secret"]
      authorization.save      
    end
    return authorization.user
  end

  def self.get_facebook_friends(current_user)    
    @graph = Koala::Facebook::API.new(current_user.authentications[0].token)
    user = @graph.get_object("me")
    friends = @graph.get_connections(user["id"], "friends")
     # user = FbGraph::User.me(current_user.authentications[0].token)
     # friends = user.friends
     #friends = @graph.fql_query("select uid, name, pic_square, email from user where uid in (select uid2 from friend where uid1 = me())")
     
     return friends
   end


def purchase
  response = process_purchase
  transactions.create!(:action => "purchase", :amount => price_in_cents, :response => response)
  cart.update_attribute(:purchased_at, Time.now) if response.success?
  response.success?
end

def express_token=(token)
  write_attribute(:express_token, token)
  if new_record? && !token.blank?
    details = EXPRESS_GATEWAY.details_for(token)
    self.express_payer_id = details.payer_id
    self.first_name = details.params["first_name"]
    self.last_name = details.params["last_name"]
  end
end

def status
  ((resumes.present?) && (role!="premium"))
end

private

def process_purchase
  if express_token.blank?
    STANDARD_GATEWAY.purchase(price_in_cents, credit_card, standard_purchase_options)
  else
    EXPRESS_GATEWAY.purchase(price_in_cents, express_purchase_options)
  end
end

def standard_purchase_options
  {
    :ip => ip_address,
    :billing_address => {
      :name     => "Ryan Bates",
      :address1 => "123 Main St.",
      :city     => "New York",
      :state    => "NY",
      :country  => "US",
      :zip      => "10001"
    }
  }
end

def express_purchase_options
  {
    :ip => ip_address,
    :token => express_token,
    :payer_id => express_payer_id
  }
end

def validate_card
  if express_token.blank? && !credit_card.valid?
    credit_card.errors.full_messages.each do |message|
      errors.add_to_base message
    end
  end
end

end


# def self.from_omniauth(auth, current_user)

#     authorization = Authorization.where(:provider => auth.provider, :uid => auth.uid.to_s).first_or_initialize

#     if authorization.user.blank?

#       user = current_user.nil? ? User.where('email = ?', auth["info"]["email"]).first : current_user
#       if user.blank?
#         user = User.new
#         user.password = Devise.friendly_token[0,10]
#         # user.name = auth.info.name
#         user.email = !auth.info.email.nil? ? auth.info.email : "#{auth.info.nickname.downcase}@gmail.com"
#         user.skip_confirmation!
#         auth.provider == "twitter" ?  user.save(:validate => false) :  user.save
#       end
#      # authorization.username = auth.info.nickname

#       authorization.avatar = (auth.provider != 'facebook') ? auth.info.image : auth.info.image.gsub("http", "https")
#       authorization.user_id = user.id
#       authorization.save
#       authorization.update_attributes(token: auth["credentials"]["token"], secret: auth["credentials"]["secret"])
#       authorization.user.update_attributes(current_provider: auth.provider)
#       authorization.user   

#       if user.authorizations.where(provider:auth.provider).count>1
#         user.authorizations.where(provider:auth.provider)[0].delete 
#       end
#     elsif current_user.present? &&  authorization.user_id!=current_user.id
#       @user="exist"
#     end
#     authorization.user
#  end
