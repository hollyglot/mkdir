require "spec_helper"

describe HiringPartnersController do
  describe "routing" do

    it "routes to #index" do
      get("/hiring_partners").should route_to("hiring_partners#index")
    end

    it "routes to #new" do
      get("/hiring_partners/new").should route_to("hiring_partners#new")
    end

    it "routes to #show" do
      get("/hiring_partners/1").should route_to("hiring_partners#show", :id => "1")
    end

    it "routes to #edit" do
      get("/hiring_partners/1/edit").should route_to("hiring_partners#edit", :id => "1")
    end

    it "routes to #create" do
      post("/hiring_partners").should route_to("hiring_partners#create")
    end

    it "routes to #update" do
      put("/hiring_partners/1").should route_to("hiring_partners#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/hiring_partners/1").should route_to("hiring_partners#destroy", :id => "1")
    end

  end
end
