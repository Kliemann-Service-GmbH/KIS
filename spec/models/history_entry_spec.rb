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

require 'rails_helper'

RSpec.describe HistoryEntry, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
