require 'rails_helper'

RSpec.describe "rtable_items/edit", :type => :view do
  before(:each) do
    @rtable_item = assign(:rtable_item, RtableItem.create!(
      :values => "MyString",
      :position => 1
    ))
  end

  it "renders the edit rtable_item form" do
    render

    assert_select "form[action=?][method=?]", rtable_item_path(@rtable_item), "post" do

      assert_select "input#rtable_item_values[name=?]", "rtable_item[values]"

      assert_select "input#rtable_item_position[name=?]", "rtable_item[position]"
    end
  end
end
