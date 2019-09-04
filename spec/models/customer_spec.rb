# == Schema Information
#
# Table name: customers
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  address_id :bigint
#
# Indexes
#
#  index_customers_on_address_id  (address_id)
#

require 'rails_helper'

RSpec.describe Customer, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
