require "rails_helper"

RSpec.describe ServiceContractsController, type: :controller do

  describe "GET index" do
    it "assigns @service_contracts" do
      get :index
      expect(assigns(:service_contracts)).to eq([])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index");
    end
  end
end
