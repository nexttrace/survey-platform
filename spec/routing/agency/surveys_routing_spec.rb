require "rails_helper"

RSpec.describe Agency::SurveysController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/agency/surveys").to route_to("agency/surveys#index")
    end

    it "routes to #new" do
      expect(get: "/agency/surveys/new").to route_to("agency/surveys#new")
    end

    it "routes to #show" do
      expect(get: "/agency/surveys/1").to route_to("agency/surveys#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/agency/surveys/1/edit").to route_to("agency/surveys#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/agency/surveys").to route_to("agency/surveys#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/agency/surveys/1").to route_to("agency/surveys#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/agency/surveys/1").to route_to("agency/surveys#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/agency/surveys/1").to route_to("agency/surveys#destroy", id: "1")
    end
  end
end
