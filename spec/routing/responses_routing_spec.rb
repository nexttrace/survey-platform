require "rails_helper"

RSpec.describe ResponsesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/responses").to route_to("responses#index")
    end

    it "routes to #new" do
      expect(get: "/responses/new").to route_to("responses#new")
    end

    it "routes to #show" do
      expect(get: "/responses/1").to route_to("responses#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/responses/1/edit").to route_to("responses#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/responses").to route_to("responses#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/responses/1").to route_to("responses#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/responses/1").to route_to("responses#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/responses/1").to route_to("responses#destroy", id: "1")
    end
  end
end
