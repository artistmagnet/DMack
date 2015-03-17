class ContactInfo < ActiveRecord::Base

  def name
    first_name + " " + last_name
  end

  def full_name
    name
  end

  def address
  	city + ", " + state + ", " + country
  end
  def social
  	facebook + "," + twitter + "," +linkedin
  end
end
