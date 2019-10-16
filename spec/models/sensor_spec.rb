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

require 'rails_helper'

RSpec.describe Sensor, type: :model do
  it "is valid with valid attributes" do
    expect(build(:sensor)).to be_valid
  end

  context "without an application_date" do
    it "sensors livetime is nil" do
      sensor = create(:sensor)
      expect(sensor.livetime).to eq nil
    end
  end

  context "with application_date" do
    it "updates the sensors livetime if SensorType has livetime set" do
      # Setup
      # create a sensor with a sensor_type were a livetime was set
      sensor = create(:sensor_with_application_date, sensor_type: create(:sensor_type, livetime: 5))
      livetime = sensor.application_date.blank? ? nil : sensor.application_date + sensor.sensor_type.livetime.to_i.year
      expect(sensor.livetime).to eq livetime
    end

    it "returns nil if SensorType has no livetime set" do
      # Setup
      # SensorType.livetime not set
      sensor = create(:sensor_with_application_date, sensor_type: create(:sensor_type, livetime: nil))
      livetime = sensor.application_date.blank? || sensor.sensor_type.livetime.blank? ? nil : sensor.application_date + sensor.sensor_type.livetime.to_i.year
      expect(sensor.livetime).to eq livetime
    end
  end
end

# Virtual Attributes
# Prefix instance methods with a '#'
RSpec.describe Sensor, "#operational_range" do
  it "it returns the operational sensor range, called Messbereich in germany" do
    # setup
    sensor = build(:sensor_with_range)

    # exercise and verify
    expect(sensor.operational_range).to eq "0.0-100.0"
  end
end
