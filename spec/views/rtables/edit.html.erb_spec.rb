require 'rails_helper'

RSpec.describe "rtables/edit", :type => :view do
  before(:each) do
    @rtable = assign(:rtable, Rtable.create!(
      :title => "MyString",
      :columns => "MyString",
      :positions => 1,
      :type => ""
    ))
  end

  it "renders the edit rtable form" do
    render

    assert_select "form[action=?][method=?]", rtable_path(@rtable), "post" do

      assert_select "input#rtable_title[name=?]", "rtable[title]"

      assert_select "input#rtable_columns[name=?]", "rtable[columns]"

      assert_select "input#rtable_positions[name=?]", "rtable[positions]"

      assert_select "input#rtable_type[name=?]", "rtable[type]"
    end
  end
end
