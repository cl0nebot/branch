require "spec_helper"

describe DiscussionTopicsController do
  describe "routing" do

    it "routes to #index" do
      get("/discussion_topics").should route_to("discussion_topics#index")
    end

    it "routes to #new" do
      get("/discussion_topics/new").should route_to("discussion_topics#new")
    end

    it "routes to #show" do
      get("/discussion_topics/1").should route_to("discussion_topics#show", :id => "1")
    end

    it "routes to #edit" do
      get("/discussion_topics/1/edit").should route_to("discussion_topics#edit", :id => "1")
    end

    it "routes to #create" do
      post("/discussion_topics").should route_to("discussion_topics#create")
    end

    it "routes to #update" do
      put("/discussion_topics/1").should route_to("discussion_topics#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/discussion_topics/1").should route_to("discussion_topics#destroy", :id => "1")
    end

  end
end
