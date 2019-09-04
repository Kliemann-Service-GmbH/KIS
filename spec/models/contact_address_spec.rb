# == Schema Information
#
# Table name: contact_addresses
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  address_id :bigint
#
# Indexes
#
#  index_contact_addresses_on_address_id  (address_id)
#

require 'rails_helper'

RSpec.describe ContactAddress, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
