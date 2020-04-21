require 'rails_helper'

RSpec.describe "Codes", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/codes/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/codes/show"
      expect(response).to have_http_status(:success)
    end
  end

end
