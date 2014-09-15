require 'rails_helper'

RSpec.describe "roles/index", :type => :view do
  before(:each) do
    assign(:roles, [
      Role.create!(
        :name => "Name",
        :resume_id => 1,
        :production_id => 2
      ),
      Role.create!(
        :name => "Name",
        :resume_id => 1,
        :production_id => 2
      )
    ])
  end

  it "renders a list of roles" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
