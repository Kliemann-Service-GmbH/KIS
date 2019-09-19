# == Schema Information
#
# Table name: history_entries
#
#  id                :bigint           not null, primary key
#  entry             :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  central_device_id :bigint
#
# Indexes
#
#  index_history_entries_on_central_device_id  (central_device_id)
#
# Foreign Keys
#
#  fk_rails_...  (central_device_id => central_devices.id)
#

class HistoryEntry < ApplicationRecord
  belongs_to :central_device, optional: true
end
