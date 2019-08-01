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
