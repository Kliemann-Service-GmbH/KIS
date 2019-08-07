class ServiceProtocol < ApplicationRecord
  # Associations
  belongs_to :central_device, inverse_of: :service_protocols

  # Validations
  validates :central_device, presence: true

  # Full-Text search in PostgreSQL database
  include PgSearch
  multisearchable against: [:serial_number, :customer_number, :service_object_number]

  pg_search_scope :search_full_text, associated_against: {
    central_device: [:serial_number, :device_type, :location]
  },
    using: {
      tsearch: {
        prefix: true,
        negation: true,
        any_word: true
      }
    }

    # Virtual attributes
    def serial_number
      central_device.serial_number
    end

    # Used in:
    # * multisearchable
    def customer_number
      central_device.service_object.customer.address.address_number
    end

    # Used in:
    # * multisearchable
    def service_object_number
      central_device.service_object.address.address_number
    end
end
