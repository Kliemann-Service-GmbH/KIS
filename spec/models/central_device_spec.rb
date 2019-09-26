# == Schema Information
#
# Table name: central_devices
#
#  id                :bigint           not null, primary key
#  accu_montage_date :datetime
#  device_number     :string           default("0")
#  device_type       :string
#  has_accu          :boolean
#  location          :string
#  montage_date      :datetime
#  serial_number     :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  service_object_id :bigint
#
# Indexes
#
#  index_central_devices_on_service_object_id  (service_object_id)
#

# https://gist.github.com/kyletcarlson/6234923
# https://github.com/thoughtbot/shoulda-matchers

require 'rails_helper'

RSpec.describe CentralDevice, type: :model do

  it "is valid with valid attributes" do
    expect(build(:central_device)).to be_valid
  end

  # Lazily loaded to ensure it's only used when it's needed
  # RSpec tip: Try to avoid @instance_variables if possible. They're slow
  let(:factory_instance) { build(:central_device) }

  describe 'associations' do
    it { should belong_to(:service_object) }
  end

  describe 'validations' do
    it { should validate_presence_of(:device_type) }
  end

  describe "public instance methods" do
    context "responds to its methods" do
      it { expect(factory_instance).to respond_to(:object_device_number) }
    end

    context "executes methods correctly" do
      context "#object_device_number" do
        it "shows object_number followed by the device_number" do
          expect(factory_instance.object_device_number).to eq("#{factory_instance.service_object.object_number}-#{factory_instance.device_number}")
        end
      end
    end
  end
end
