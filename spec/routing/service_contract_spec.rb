require "rails_helper"

RSpec.describe ServiceContract, type: :routing do
  describe 'Index view' do
    it "should route 'service_contracts/", :to => 'service_contracts#index' do
      expect(:get => "/service_contracts").to route_to(
        controller: "service_contracts", action: "index"
      )
    end
  end

  describe 'No delete action' do
    it "should not be possible to delete service_contracts" do
      expect(delete: "/service_contracts/1").not_to be_routable
    end
  end
end


