require 'rails_helper'

RSpec.describe "RtableItems", :type => :request do
  describe "GET /rtable_items" do
    it "works! (now write some real specs)" do
      get rtable_items_path
      expect(response).to have_http_status(200)
    end
  end
end
