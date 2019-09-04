# == Schema Information
#
# Table name: service_protocols
#
#  id                  :bigint           not null, primary key
#  is_commisioning     :boolean
#  is_expenditure      :boolean
#  is_function_check   :boolean
#  is_montage          :boolean
#  is_order            :boolean
#  is_repair           :boolean
#  is_service_contract :boolean
#  is_systemcheck      :boolean
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  central_device_id   :bigint
#
# Indexes
#
#  index_service_protocols_on_central_device_id  (central_device_id)
#

class ServiceProtocol < ApplicationRecord
  # Associations
  belongs_to :central_device

  # Validations
  validates :central_device, presence: true

  # Full-Text search in PostgreSQL database
  include PgSearch::Model
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
