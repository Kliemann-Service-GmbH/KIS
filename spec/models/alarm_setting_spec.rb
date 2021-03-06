# == Schema Information
#
# Table name: alarm_settings
#
#  id                :bigint           not null, primary key
#  outputs           :hstore
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  central_device_id :bigint
#
# Indexes
#
#  index_alarm_settings_on_central_device_id  (central_device_id)
#

require 'rails_helper'

RSpec.describe AlarmSetting, type: :model do
  it "is valid with valid attributes" do
    expect(build(:alarm_setting)).to be_valid
  end
end
