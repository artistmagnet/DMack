require 'rails_helper'

RSpec.describe "venues/edit", :type => :view do
  before(:each) do
    @venue = assign(:venue, Venue.create!(
      :name => "MyString",
      :address1 => "MyString",
      :address2 => "MyString",
      :city => "MyString",
      :zipcode => "MyString",
      :state => "MyString",
      :country => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit venue form" do
    render

    assert_select "form[action=?][method=?]", venue_path(@venue), "post" do

      assert_select "input#venue_name[name=?]", "venue[name]"

      assert_select "input#venue_address1[name=?]", "venue[address1]"

      assert_select "input#venue_address2[name=?]", "venue[address2]"

      assert_select "input#venue_city[name=?]", "venue[city]"

      assert_select "input#venue_zipcode[name=?]", "venue[zipcode]"

      assert_select "input#venue_state[name=?]", "venue[state]"

      assert_select "input#venue_country[name=?]", "venue[country]"

      assert_select "textarea#venue_description[name=?]", "venue[description]"
    end
  end
end
