require 'rails_helper'

RSpec.describe "rtable_items/show", :type => :view do
  before(:each) do
    @rtable_item = assign(:rtable_item, RtableItem.create!(
      :values => "Values",
      :position => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Values/)
    expect(rendered).to match(/1/)
  end
end
