require 'rails_helper'

RSpec.describe "roles/new", :type => :view do
  before(:each) do
    assign(:role, Role.new(
      :name => "MyString",
      :resume_id => 1,
      :production_id => 1
    ))
  end

  it "renders new role form" do
    render

    assert_select "form[action=?][method=?]", roles_path, "post" do

      assert_select "input#role_name[name=?]", "role[name]"

      assert_select "input#role_resume_id[name=?]", "role[resume_id]"

      assert_select "input#role_production_id[name=?]", "role[production_id]"
    end
  end
end
