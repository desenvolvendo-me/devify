require 'rails_helper'

RSpec.describe "ProjectSimulations", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/project_simulations/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/project_simulations/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/project_simulations/new"
      expect(response).to have_http_status(:success)
    end
  end

end
