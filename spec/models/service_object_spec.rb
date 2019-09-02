# == Schema Information
#
# Table name: service_objects
#
#  id                                    :bigint           not null, primary key
#  service_contract_auto_resume_interval :integer
#  service_contract_begin                :datetime
#  service_contract_end                  :datetime
#  created_at                            :datetime         not null
#  updated_at                            :datetime         not null
#  address_id                            :bigint
#  customer_id                           :bigint
#
# Indexes
#
#  index_service_objects_on_address_id                  (address_id)
#  index_service_objects_on_address_id_and_customer_id  (address_id,customer_id) UNIQUE
#  index_service_objects_on_customer_id                 (customer_id)
#

require 'rails_helper'

RSpec.describe ServiceObject, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
