require 'rails_helper'

RSpec.describe "shows/edit", :type => :view do
  before(:each) do
    @show = assign(:show, Show.create!(
      :production => "",
      :company => ""
    ))
  end

  it "renders the edit show form" do
    render

    assert_select "form[action=?][method=?]", show_path(@show), "post" do

      assert_select "input#show_production[name=?]", "show[production]"

      assert_select "input#show_company[name=?]", "show[company]"
    end
  end
end
