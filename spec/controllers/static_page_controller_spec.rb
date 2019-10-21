require 'rails_helper'

RSpec.describe StaticPageController, type: :controller do

  describe "GET #about" do
    it "returns http success" do
      get :about
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #changelog" do
    it "returns http success" do
      get :changelog
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #license" do
    it "returns http success" do
      get :license
      expect(response).to have_http_status(:success)
    end
  end

end
