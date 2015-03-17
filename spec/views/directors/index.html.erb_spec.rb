require 'rails_helper'

RSpec.describe "directors/index", :type => :view do
  before(:each) do
    assign(:directors, [
      Director.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :email => "Email",
        :text => "MyText"
      ),
      Director.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :email => "Email",
        :text => "MyText"
      )
    ])
  end

  it "renders a list of directors" do
    render
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
