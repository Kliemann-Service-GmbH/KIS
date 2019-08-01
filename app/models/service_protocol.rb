class ServiceProtocol < ApplicationRecord
  # Associations
  belongs_to :central_device, inverse_of: :service_protocols

  # Validations
  validates :central_device, presence: true

  # Full-Text search in PostgreSQL database
  include PgSearch
  multisearchable against: [:device_number]

  pg_search_scope :search_full_text, associated_against: {
    central_device: :device_number,
  },
    using: {
      tsearch: {
        prefix: true,
        negation: true,
        any_word: true
      }
    }

    # Virtual attributes
    def device_number
      central_device.device_number
    end

end
