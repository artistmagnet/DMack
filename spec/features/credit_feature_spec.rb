require 'rails_helper'
require 'spec_lib'

feature "Credit" do
  before :each do
    user ||= FactoryGirl.create(:user)
    visit_home
  end

  feature "creation" do
    scenario "should not allow to change director if production is unselected", :js => true do
      click_on 'New Resume'
      click_link 'Add Credit'
      # save_and_open_page
      director_field = find("#role_director_id_chosen")
      expect(director_field).to have_css('[disabled]')
    end

  end

#TODO
  # scenario "should not be editable by generic users", :js => true do
  # end

end

