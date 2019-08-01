class ServiceObject < ApplicationRecord
  # Associations
  belongs_to :customer, inverse_of: :service_objects
  belongs_to :address

  # has_many :object_maintenances, dependent: :destroy
  # has_many :contact_addresses, through: :object_maintenances, dependent: :destroy
  has_many :central_devices, dependent: :destroy

  # Validations
  validates :address, presence: true
  validates :customer, presence: true
  # TODO: test central_device presence
  # validates :central_device, presence: true

  # Nested Attributes
  # accepts_nested_attributes_for :central_device

  # Full-Text search in PostgreSQL database
  include PgSearch
  multisearchable against: [:object_number, :address_details]

  pg_search_scope :search_full_text, against: [:id], associated_against: {
    address: [:address_details],
  },
    using: {
      tsearch: {
        prefix: true,
        negation: true,
        any_word: true
      }
    }

  # Virtual Attributes

  # used in:
  # * app/views/central_devices/_form.html.erb
  # * app/views/central_devices/show.html.erb
  def service_object_address_details
  "#{address.address_details['address_number']} #{address.address_details['match_code']}"
  end

  def object_number
    address.address_number
  end

  def customer_number
    customer.customer_number
  end

  def address_details
    address.address_details
  end

end
