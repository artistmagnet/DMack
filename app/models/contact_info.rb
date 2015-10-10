class ContactInfo < ActiveRecord::Base

  def name
    first_name + " " + last_name if first_name && last_name
  end

  def full_name
    name
  end

  def address
  	address = ""
    if city.present?
      address = address + city + ", "
    elsif state.present?
      address = address + state + ", "
    elsif country.present?
      address = address + country    
    end
    address
  end
  
  def social
  	social = ""
    if facebook.present?
      social = social + facebook + "," 
    elsif twitter.present?
      social =  social + twitter + "," 
    elsif linkedin.present?
      social = social + linkedin
    end 
    social 
  end
end
