require "rails_helper"

RSpec.describe RtableItemsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/rtable_items").to route_to("rtable_items#index")
    end

    it "routes to #new" do
      expect(:get => "/rtable_items/new").to route_to("rtable_items#new")
    end

    it "routes to #show" do
      expect(:get => "/rtable_items/1").to route_to("rtable_items#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/rtable_items/1/edit").to route_to("rtable_items#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/rtable_items").to route_to("rtable_items#create")
    end

    it "routes to #update" do
      expect(:put => "/rtable_items/1").to route_to("rtable_items#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/rtable_items/1").to route_to("rtable_items#destroy", :id => "1")
    end

  end
end
