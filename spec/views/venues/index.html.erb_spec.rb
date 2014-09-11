require 'rails_helper'

RSpec.describe "venues/index", :type => :view do
  before(:each) do
    assign(:venues, [
      Venue.create!(
        :name => "Name",
        :address1 => "Address1",
        :address2 => "Address2",
        :city => "City",
        :zipcode => "Zipcode",
        :state => "State",
        :country => "Country",
        :description => "MyText"
      ),
      Venue.create!(
        :name => "Name",
        :address1 => "Address1",
        :address2 => "Address2",
        :city => "City",
        :zipcode => "Zipcode",
        :state => "State",
        :country => "Country",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of venues" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Address1".to_s, :count => 2
    assert_select "tr>td", :text => "Address2".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "Zipcode".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
