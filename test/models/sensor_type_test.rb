# == Schema Information
#
# Table name: sensor_types
#
#  id                :bigint           not null, primary key
#  default_livetime  :datetime
#  default_max_value :decimal(, )
#  default_min_value :decimal(, )
#  name              :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'test_helper'

class SensorTypeTest < ActiveSupport::TestCase
  def setup
    @sensor_type = create(:sensor_type)
  end

  test 'valid sensor_type' do
    assert @sensor_type.valid?, 'Factory is invalid'
  end

  # Validations
  test 'invalid without name' do
    @sensor_type.name = nil
    assert_not @sensor_type.valid?, 'saved customer without a name'
    assert_not_nil @sensor_type.errors[:name], 'no validation error for name present'
  end
end
