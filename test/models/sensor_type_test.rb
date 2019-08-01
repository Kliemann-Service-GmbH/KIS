require 'test_helper'

class SensorTypeTest < ActiveSupport::TestCase
  def setup
    @sensor_type = sensor_types(:baroness)
  end

  test 'valid sensor_type' do
    assert @sensor_type.valid?, 'Fixture baroness is invalid'
  end

  # Validations
  test 'invalid without name' do
    @sensor_type.name = nil
    assert_not @sensor_type.valid?, 'saved customer without a name'
    assert_not_nil @sensor_type.errors[:name], 'no validation error for name present'
  end
end
