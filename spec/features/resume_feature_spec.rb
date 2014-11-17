require 'spec_lib'

feature "Resume" do
  before(:each) do
    user = FactoryGirl.create(:user)
    puts "USERFIRST: #{User.first.to_json}"
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(User.first)
    visit_home
  end

  scenario "Creating a new Resume", :js => true do
    puts "INSIDE TEST: #{User.all.to_json}"
    within("#sidebar-item-build-resume") do
      click_link 'New Resume'
    end
    expect(page).to have_text('Credits')
  end

  # scenario "Ill-formatted email", :js => true do
  #   within("#sign-in") do
  #     fill_in 'first_contact[email]', :with => 'invalidemail'
  #     click_button 'Submit'
  #   end
  #   expect(page).to have_selector('#sign-in .w-form-fail', visible: true)
  # end
end

