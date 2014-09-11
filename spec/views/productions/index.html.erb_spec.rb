require 'rails_helper'

RSpec.describe "productions/index", :type => :view do
  before(:each) do
    assign(:productions, [
      Production.create!(
        :name => "Name",
        :description => "MyText"
      ),
      Production.create!(
        :name => "Name",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of productions" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
