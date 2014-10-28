require 'rails_helper'

RSpec.describe "rtables/index", :type => :view do
  before(:each) do
    assign(:rtables, [
      Rtable.create!(
        :title => "Title",
        :columns => "Columns",
        :positions => 1,
        :type => "Type"
      ),
      Rtable.create!(
        :title => "Title",
        :columns => "Columns",
        :positions => 1,
        :type => "Type"
      )
    ])
  end

  it "renders a list of rtables" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Columns".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
  end
end
