require 'test_helper'

class AlarmSettingTest < ActiveSupport::TestCase
  def setup
    @alarm_setting = alarm_settings(:baroness)
  end

  test 'valid alarm_setting' do
    assert @alarm_setting.valid?, 'Fixture baroness is invalid'
  end

  # Validations
  test 'invalid without central_device' do
    @alarm_setting.central_device = nil
    assert_not @alarm_setting.valid?, 'saved alarm_setting without a central_device'
    assert_not_nil @alarm_setting.errors[:central_device], 'no validation error for central_device present'
  end


end
