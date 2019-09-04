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

class ContactAddress < ApplicationRecord
  # Associations
  belongs_to :address

  has_many :object_maintenances, dependent: :destroy, inverse_of: :contact_address

  # Validations
  # validates :address, presence: true

end
