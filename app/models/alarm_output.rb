# == Schema Information
#
# Table name: alarm_outputs
#
#  id                :bigint           not null, primary key
#  invert            :boolean
#  key               :string
#  value             :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  central_device_id :bigint
#
# Indexes
#
#  index_alarm_outputs_on_central_device_id  (central_device_id)
#
# Foreign Keys
#
#  fk_rails_...  (central_device_id => central_devices.id)
#


class AlarmOutput < ApplicationRecord
  belongs_to :central_device
end
