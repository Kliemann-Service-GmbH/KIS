require 'rails_helper'

RSpec.describe SystemTaskController, type: :controller do

  describe "GET #db_import_legacy" do
    it "returns http success" do
      get :db_import_legacy
      expect(response).to have_http_status(:success)
    end
  end

end
