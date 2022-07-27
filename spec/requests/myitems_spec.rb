require 'rails_helper'

RSpec.describe "Myitems", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/myitems/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/myitems/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
