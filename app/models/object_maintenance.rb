class ObjectMaintenance < ApplicationRecord
  # Associations
  belongs_to :contact_address
  belongs_to :service_object

  # Validations
  validates :service_object, presence: true
  validates :contact_address, presence: true

end
