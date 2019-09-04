# == Schema Information
#
# Table name: object_maintenances
#
#  id                 :bigint           not null, primary key
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  contact_address_id :bigint
#  service_object_id  :bigint
#
# Indexes
#
#  index_object_maintenances_on_contact_address_id  (contact_address_id)
#  index_object_maintenances_on_service_object_id   (service_object_id)
#

require 'rails_helper'

RSpec.describe ObjectMaintenance, type: :model do
  it "is valid with valid attributes" do
    expect(build(:object_maintenance)).to be_valid
  end
end
