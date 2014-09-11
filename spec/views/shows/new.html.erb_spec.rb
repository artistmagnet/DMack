require 'rails_helper'

RSpec.describe "shows/new", :type => :view do
  before(:each) do
    assign(:show, Show.new(
      :production => "",
      :company => ""
    ))
  end

  it "renders new show form" do
    render

    assert_select "form[action=?][method=?]", shows_path, "post" do

      assert_select "input#show_production[name=?]", "show[production]"

      assert_select "input#show_company[name=?]", "show[company]"
    end
  end
end
