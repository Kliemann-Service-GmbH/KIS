class AlarmSetting < ApplicationRecord
  # Associations
  belongs_to :central_device, inverse_of: :alarm_settings

  # Validations
  validates :central_device, presence: true

end
