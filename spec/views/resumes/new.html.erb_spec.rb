require 'rails_helper'

RSpec.describe "resumes/new", :type => :view do
  before(:each) do
    assign(:resume, Resume.new(
      :type => 1,
      :user_id => 1
    ))
  end

  it "renders new resume form" do
    render

    assert_select "form[action=?][method=?]", resumes_path, "post" do

      assert_select "input#resume_type[name=?]", "resume[type]"

      assert_select "input#resume_user_id[name=?]", "resume[user_id]"
    end
  end
end
