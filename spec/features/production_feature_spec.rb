require 'rails_helper'
require 'spec_lib'

feature "Production" do
  before :each do
    open_credit_form
  end

  feature "creation" do
    new_name = 'New Production'

    before :each do
      select_from_chosen new_name, :from => 'Production*'
      first(".add_new").click
    end

    scenario "should close the Production form", :js => true do
      # save_and_open_page
      within("#add-resume-production") do
        fill_in_production(name: new_name)
        click_button("Done")
      end
      begin
        expect(page).not_to have_css('#add-resume-production')
      rescue Capybara::Poltergeist::JavascriptError
      end
    end

    scenario "should enable to choose the Director in the underlaying Credit form", :js => true do
      # save_and_open_page
      within("#add-resume-production") do
        fill_in_production(name: new_name)
        click_button("Done")
      end
      expect(find('#role_director_id_chosen', :visible => false)).not_to have_css('input:disabled')
    end

    # scenario "should write the name to the Credit form", :js => true, :focus => true do
    #   fill_in_production(name: new_name)
    #   within('#add-resume-production') do
    #     click_button("Done")
    #   end
    #   prod_field = first(".chosen-single>span")
    #   puts "FIELD: #{prod_field}"
    #   puts "VALUE: #{prod_field.value}"
    #   puts "TEXT: #{prod_field.text}"
    #   puts "NATIVE VALUE: #{prod_field.native.value}"
    #   puts "TEXT: #{prod_field.native.text}"
    #   expect(prod_field.value).to eql(new_name)
    # end

  end

#TODO
  # scenario "should not be editable by generic users", :js => true do
  # end

end

