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

require 'test_helper'

class AlarmSettingTest < ActiveSupport::TestCase
  def setup
    @alarm_setting = create(:alarm_setting)
  end

  test 'valid alarm_setting' do
    assert @alarm_setting.valid?, 'Factory is invalid'
  end

  # Validations
  test 'invalid without central_device' do
    @alarm_setting.central_device = nil
    assert_not @alarm_setting.valid?, 'saved alarm_setting without a central_device'
    assert_not_nil @alarm_setting.errors[:central_device], 'no validation error for central_device present'
  end


end
