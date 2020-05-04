require 'rails_helper'

RSpec.describe "Codes", type: :request do

  describe "GET /show" do
    pending "returns http success" do
      get "/codes/abc123"
      expect(response).to have_http_status(:success)
    end
  end

end
