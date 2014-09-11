require 'rails_helper'

RSpec.describe "productions/edit", :type => :view do
  before(:each) do
    @production = assign(:production, Production.create!(
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit production form" do
    render

    assert_select "form[action=?][method=?]", production_path(@production), "post" do

      assert_select "input#production_name[name=?]", "production[name]"

      assert_select "textarea#production_description[name=?]", "production[description]"
    end
  end
end
