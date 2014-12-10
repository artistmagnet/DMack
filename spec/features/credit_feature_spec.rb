require 'rails_helper'
require 'spec_lib'

feature "Credit" do
  before :each do
    visit_home
    click_on 'New Resume'
    click_link 'Add Credit'
  end

  feature "creation" do
    scenario "should not allow to change director if production is unselected", :js => true do
      director_field = find("#role_director_id_chosen")
      expect(director_field).to have_css('[disabled]')
    end

    scenario "should allow to change director after production has been selected", :js => true do
      select_from_chosen 'Test Production', :from => 'Production*'
      # save_and_open_page
      director_field = find("#role_director_id_chosen")
      expect(director_field).not_to have_css('[disabled]')
    end
  end

  feature "editing" do

    before :each do
      Role.all do |role|
        role.production = Production.first
        role.save
      end
      role = Role.where('resume_id IS NOT NULL').first
      resume = role.resume

      visit_home
      select_resume_from_sidebar(resume)
      first('.fa-edit').click
    end

    scenario "should allow to change director", :js => true do
      director_field = find("#role_director_id_chosen")
      expect(director_field).not_to have_css('[disabled]')
    end

    scenario "should allow to change director after production has been selected", :js => true do
      select_from_chosen 'Test Production', :from => 'Production*'
      director_field = find("#role_director_id_chosen")
      expect(director_field).not_to have_css('[disabled]')
    end
  end


#TODO
  # scenario "should not be editable by generic users", :js => true do
  # end

end

