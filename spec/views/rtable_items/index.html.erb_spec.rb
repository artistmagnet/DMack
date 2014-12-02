require 'rails_helper'

RSpec.describe "rtable_items/index", :type => :view do
  before(:each) do
    assign(:rtable_items, [
      RtableItem.create!(
        :values => "Values",
        :position => 1
      ),
      RtableItem.create!(
        :values => "Values",
        :position => 1
      )
    ])
  end

  it "renders a list of rtable_items" do
    render
    assert_select "tr>td", :text => "Values".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
