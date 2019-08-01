require 'test_helper'

class SensorTest < ActiveSupport::TestCase
  def setup
    @sensor = sensors(:baroness)
  end

  test 'valid sensor' do
    assert @sensor.valid?, 'Fixture baroness is invalid'
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
end
