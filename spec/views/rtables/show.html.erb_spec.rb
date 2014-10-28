require 'rails_helper'

RSpec.describe "rtables/show", :type => :view do
  before(:each) do
    @rtable = assign(:rtable, Rtable.create!(
      :title => "Title",
      :columns => "Columns",
      :positions => 1,
      :type => "Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Columns/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Type/)
  end
end
