# == Schema Information
#
# Table name: alarm_settings
#
#  id                :bigint           not null, primary key
#  outputs           :hstore
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  central_device_id :bigint
#
# Indexes
#
#  index_alarm_settings_on_central_device_id  (central_device_id)
#

class AlarmSetting < ApplicationRecord
  # Associations
  belongs_to :central_device, inverse_of: :alarm_settings

  # Validations
  validates :central_device, presence: true

end
