require 'rails_helper'

RSpec.describe "directors/edit", :type => :view do
  before(:each) do
    @director = assign(:director, Director.create!(
      :first_name => "MyString",
      :last_name => "MyString",
      :email => "MyString",
      :text => "MyText"
    ))
  end

  it "renders the edit director form" do
    render

    assert_select "form[action=?][method=?]", director_path(@director), "post" do

      assert_select "input#director_first_name[name=?]", "director[first_name]"

      assert_select "input#director_last_name[name=?]", "director[last_name]"

      assert_select "input#director_email[name=?]", "director[email]"

      assert_select "textarea#director_text[name=?]", "director[text]"
    end
  end
end
