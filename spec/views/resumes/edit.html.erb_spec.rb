require 'rails_helper'

RSpec.describe "resumes/edit", :type => :view do
  before(:each) do
    @resume = assign(:resume, Resume.create!(
      :type => 1,
      :user_id => 1
    ))
  end

  it "renders the edit resume form" do
    render

    assert_select "form[action=?][method=?]", resume_path(@resume), "post" do

      assert_select "input#resume_type[name=?]", "resume[type]"

      assert_select "input#resume_user_id[name=?]", "resume[user_id]"
    end
  end
end
