class Order < ActiveRecord::Base
  belongs_to :user

def purchase(express_token1,payer_id)
  response = process_purchase(express_token1,payer_id)
  #transactions.create!(:action => "purchase", :amount => 100, :response => response)
  #cart.update_attribute(:purchased_at, Time.now) if response.success?
  response.success?
end

def express_token=(token)
  write_attribute(:express_token, token)
  if new_record? && !token.blank?
    details = EXPRESS_GATEWAY.details_for(token)
    self.express_payer_id = details.payer_id
    #self.first_name = details.params["first_name"]
    #self.last_name = details.params["last_name"]
  end
end

private

def process_purchase(express_token1,payer_id)
  if express_token1.blank?
    STANDARD_GATEWAY.purchase(10 * 100, credit_card, standard_purchase_options)
  else
    EXPRESS_GATEWAY.purchase(10 * 100, express_purchase_options(express_token1,payer_id))
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

def express_purchase_options(express_token1,payer_id)
  {
    :ip => ip_address,
    :token => express_token1,
    :payer_id => payer_id
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
