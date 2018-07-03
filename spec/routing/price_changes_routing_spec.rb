require "rails_helper"

RSpec.describe PriceChangesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/price_changes").to route_to("price_changes#index")
    end


    it "routes to #show" do
      expect(:get => "/price_changes/1").to route_to("price_changes#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/price_changes").to route_to("price_changes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/price_changes/1").to route_to("price_changes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/price_changes/1").to route_to("price_changes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/price_changes/1").to route_to("price_changes#destroy", :id => "1")
    end

  end
end
