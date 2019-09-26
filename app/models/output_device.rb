# == Schema Information
#
# Table name: output_devices
#
#  id                :bigint           not null, primary key
#  accu_montage_date :datetime
#  count             :integer
#  device_type       :string
#  has_accu          :boolean
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

  # Validations
  validates :device_type, presence: true

  # Nested Attributes

  # Virtual Attributes
end
