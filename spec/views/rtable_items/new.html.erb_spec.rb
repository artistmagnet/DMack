require 'rails_helper'

RSpec.describe "rtable_items/new", :type => :view do
  before(:each) do
    assign(:rtable_item, RtableItem.new(
      :values => "MyString",
      :position => 1
    ))
  end

  it "renders new rtable_item form" do
    render

    assert_select "form[action=?][method=?]", rtable_items_path, "post" do

      assert_select "input#rtable_item_values[name=?]", "rtable_item[values]"

      assert_select "input#rtable_item_position[name=?]", "rtable_item[position]"
    end
  end
end
