require 'rails_helper'

RSpec.describe "Checklists", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/checklists/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /index" do
    it "returns http success" do
      get "/checklists/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/checklists/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/checklists/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
