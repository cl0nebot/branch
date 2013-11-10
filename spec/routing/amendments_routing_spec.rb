require "spec_helper"

describe AmendmentsController do
  describe "routing" do

    it "routes to #index" do
      get("/amendments").should route_to("amendments#index")
    end

    it "routes to #new" do
      get("/amendments/new").should route_to("amendments#new")
    end

    it "routes to #show" do
      get("/amendments/1").should route_to("amendments#show", :id => "1")
    end

    it "routes to #edit" do
      get("/amendments/1/edit").should route_to("amendments#edit", :id => "1")
    end

    it "routes to #create" do
      post("/amendments").should route_to("amendments#create")
    end

    it "routes to #update" do
      put("/amendments/1").should route_to("amendments#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/amendments/1").should route_to("amendments#destroy", :id => "1")
    end

  end
end
