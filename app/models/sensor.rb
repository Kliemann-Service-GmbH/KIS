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

class Sensor < ApplicationRecord
  # Callbacks
  before_validation :update_livetime

  # Associations
  belongs_to :central_device
  belongs_to :gas_type
  belongs_to :sensor_type
  belongs_to :si_unit

  # Validations
  validates :central_device, presence: true
  validates :gas_type, presence: true
  validates :sensor_type, presence: true
  validates :si_unit, presence: true
  validates :number, presence: true

  # Virtual Attributes

  # Sensor range (Messbereich)
  # Used in app/views/service_protocols/show.pdf.prawn
  def operational_range
    if !min_value.nil? && !max_value.nil?
      "#{min_value}-#{max_value}"
    else
      ""
    end
  end


  private

  def update_livetime
    # self.livetime = self.application_date.blank? || self.sensor_type.livetime.blank? ? nil : self.application_date + self.sensor_type.livetime.to_i.year
    case self.sensor_type.livetime
    when nil
        self.livetime = self.application_date
    when self.sensor_type.livetime > nil
      if self.application_date.blank? && self.livetime.blank?
        self.livetime = nil
      elsif self.application_date.blank?
        self.livetime = nil
      elsif self.livetime.blank?
        self.livetime = nil
      else
        self.livetime = nil
      end
    when self.sensor_type.livetime < nil
      if self.application_date.blank? && self.livetime.blank?
        self.livetime = nil
      elsif self.application_date.blank?
        self.livetime = nil
      elsif self.livetime.blank?
        self.livetime = nil
      else
        self.livetime = nil
      end
    end
  end
end
