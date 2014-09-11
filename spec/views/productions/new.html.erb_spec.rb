require 'rails_helper'

RSpec.describe "productions/new", :type => :view do
  before(:each) do
    assign(:production, Production.new(
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders new production form" do
    render

    assert_select "form[action=?][method=?]", productions_path, "post" do

      assert_select "input#production_name[name=?]", "production[name]"

      assert_select "textarea#production_description[name=?]", "production[description]"
    end
  end
end
