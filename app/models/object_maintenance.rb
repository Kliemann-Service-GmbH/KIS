# == Schema Information
#
# Table name: object_maintenances
#
#  id                 :bigint           not null, primary key
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  contact_address_id :bigint
#  service_object_id  :bigint
#
# Indexes
#
#  index_object_maintenances_on_contact_address_id  (contact_address_id)
#  index_object_maintenances_on_service_object_id   (service_object_id)
#

class ObjectMaintenance < ApplicationRecord
  # Associations
  belongs_to :contact_address
  belongs_to :service_object

  # Validations
  validates :service_object, presence: true
  validates :contact_address, presence: true

end
