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
#  livetime          :datetime
#  location          :string
#  max_value         :decimal(, )
#  min_value         :decimal(, )
#  number            :integer          default(0)
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

class Sensor < ApplicationRecord
  # Associations
  belongs_to :central_device, inverse_of: :sensors
  belongs_to :gas_type, inverse_of: :sensors
  belongs_to :sensor_type, inverse_of: :sensors
  belongs_to :si_unit, inverse_of: :sensors

  # Validations
  validates :central_device, presence: true
  validates :gas_type, presence: true
  validates :sensor_type, presence: true
  validates :si_unit, presence: true
  validates :number, presence: true
end
