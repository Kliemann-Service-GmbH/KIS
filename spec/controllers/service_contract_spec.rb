require "rails_helper"

RSpec.describe ServiceContract, type: :controller do

  describe "GET index" do
    it "assigns @serive_contracts" do
      get :index
      exoect(assigns(:service_contracts)).to eq([])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index");
    end
  end
end
