require 'rails_helper'

RSpec.describe "shows/show", :type => :view do
  before(:each) do
    @show = assign(:show, Show.create!(
      :production => "",
      :company => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
