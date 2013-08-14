require "spec_helper"

describe MentorsController do
  describe "routing" do

    it "routes to #index" do
      get("/mentors").should route_to("mentors#index")
    end

    it "routes to #new" do
      get("/mentors/new").should route_to("mentors#new")
    end

    it "routes to #show" do
      get("/mentors/1").should route_to("mentors#show", :id => "1")
    end

    it "routes to #edit" do
      get("/mentors/1/edit").should route_to("mentors#edit", :id => "1")
    end

    it "routes to #create" do
      post("/mentors").should route_to("mentors#create")
    end

    it "routes to #update" do
      put("/mentors/1").should route_to("mentors#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/mentors/1").should route_to("mentors#destroy", :id => "1")
    end

  end
end
