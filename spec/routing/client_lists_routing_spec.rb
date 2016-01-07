require "spec_helper"

describe ClientListsController do
  describe "routing" do

    it "routes to #index" do
      get("/client_lists").should route_to("client_lists#index")
    end

    it "routes to #new" do
      get("/client_lists/new").should route_to("client_lists#new")
    end

    it "routes to #show" do
      get("/client_lists/1").should route_to("client_lists#show", :id => "1")
    end

    it "routes to #edit" do
      get("/client_lists/1/edit").should route_to("client_lists#edit", :id => "1")
    end

    it "routes to #create" do
      post("/client_lists").should route_to("client_lists#create")
    end

    it "routes to #update" do
      put("/client_lists/1").should route_to("client_lists#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/client_lists/1").should route_to("client_lists#destroy", :id => "1")
    end

  end
end
