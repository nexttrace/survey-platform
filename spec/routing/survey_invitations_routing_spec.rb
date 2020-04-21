require "rails_helper"

RSpec.describe SurveyInvitationsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/survey_invitations").to route_to("survey_invitations#index")
    end

    it "routes to #new" do
      expect(get: "/survey_invitations/new").to route_to("survey_invitations#new")
    end

    it "routes to #show" do
      expect(get: "/survey_invitations/1").to route_to("survey_invitations#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/survey_invitations/1/edit").to route_to("survey_invitations#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/survey_invitations").to route_to("survey_invitations#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/survey_invitations/1").to route_to("survey_invitations#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/survey_invitations/1").to route_to("survey_invitations#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/survey_invitations/1").to route_to("survey_invitations#destroy", id: "1")
    end
  end
end
