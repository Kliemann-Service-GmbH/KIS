# == Schema Information
#
# Table name: sensors
#
#  id                :bigint           not null, primary key
#  alarm_point_1     :decimal(, )
#  alarm_point_2     :decimal(, )
#  alarm_point_3     :decimal(, )
#  alarm_point_4     :decimal(, )
#  application_date  :datetime
#  case_type         :integer
#  livetime          :datetime
#  location          :string
#  max_value         :decimal(, )
#  min_value         :decimal(, )
#  number            :string           default("0")
#  zero_point        :decimal(, )
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  central_device_id :bigint
#  gas_type_id       :bigint
#  sensor_type_id    :bigint
#  si_unit_id        :bigint
#
# Indexes
#
#  index_sensors_on_central_device_id  (central_device_id)
#  index_sensors_on_gas_type_id        (gas_type_id)
#  index_sensors_on_sensor_type_id     (sensor_type_id)
#  index_sensors_on_si_unit_id         (si_unit_id)
#

require 'test_helper'

class SensorTest < ActiveSupport::TestCase
  def setup
    @sensor = create(:sensor)
  end

  test 'valid sensor' do
    assert @sensor.valid?, 'Factory is invalid'
  end

  # Validations
  test 'invalid without central_device' do
    @sensor.central_device = nil
    assert_not @sensor.valid?, 'saved customer without a central_device'
    assert_not_nil @sensor.errors[:central_device], 'no validation error for central_device present'
  end

  test 'invalid without gas_type' do
    @sensor.gas_type = nil
    assert_not @sensor.valid?, 'saved customer without a gas_type'
    assert_not_nil @sensor.errors[:gas_type], 'no validation error for gas_type present'
  end

  test 'invalid without sensor_type' do
    @sensor.sensor_type = nil
    assert_not @sensor.valid?, 'saved customer without a sensor_type'
    assert_not_nil @sensor.errors[:sensor_type], 'no validation error for sensor_type present'
  end

  test 'invalid without si_unit' do
    @sensor.si_unit = nil
    assert_not @sensor.valid?, 'saved customer without a si_unit'
    assert_not_nil @sensor.errors[:si_unit], 'no validation error for si_unit present'
  end

  test 'invalid without number' do
    @sensor.number = nil
    assert_not @sensor.valid?, 'saved customer without a number'
    assert_not_nil @sensor.errors[:number], 'no validation error for number present'
  end

  # Positive validations Sensor Number
  test 'valid with string as number' do
    @sensor = create(:sensor, number: '1-abc')
    assert @sensor.valid?, 'sensor valid with string as number'
  end

  test 'valid with float as number' do
    @sensor = create(:sensor, number: 3.21)
    assert @sensor.valid?, 'sensor valid with float as number'
  end

  test 'valid with integer as number' do
    @sensor = create(:sensor, number: 1)
    assert @sensor.valid?, 'sensor valid with integer as number'
  end
end
