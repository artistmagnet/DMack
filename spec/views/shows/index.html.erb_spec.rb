require 'rails_helper'

RSpec.describe "shows/index", :type => :view do
  before(:each) do
    assign(:shows, [
      Show.create!(
        :production => "",
        :company => ""
      ),
      Show.create!(
        :production => "",
        :company => ""
      )
    ])
  end

  it "renders a list of shows" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
