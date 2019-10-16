require 'rails_helper'

RSpec.describe SystemTaskController, type: :controller do

  describe "GET #db_import_legacy" do
    it "redirects to fallback_location or root_path" do
      get :db_import_legacy
      expect(response).to redirect_to(root_path)
    end
  end

end
