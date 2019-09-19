# == Schema Information
#
# Table name: output_devices
#
#  id                :bigint           not null, primary key
#  count             :integer
#  device_type       :string
#  location          :string
#  montage_date      :datetime
#  status            :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  accu_id           :bigint
#  central_device_id :bigint
#
# Indexes
#
#  index_output_devices_on_accu_id            (accu_id)
#  index_output_devices_on_central_device_id  (central_device_id)
#
# Foreign Keys
#
#  fk_rails_...  (accu_id => accus.id)
#  fk_rails_...  (central_device_id => central_devices.id)
#

class OutputDevice < ApplicationRecord
  # Associations
  belongs_to :central_device, optional: true
  belongs_to :accu, optional: true

  # Validations
  validates :device_type, presence: true

  # Virtual Attributes
end
