class Customer < ApplicationRecord
  # Associations
  belongs_to :address
  has_many :service_objects, dependent: :destroy

  # Validations
  validates :address, presence: true

  # Full-Text search in PostgreSQL database
  include PgSearch
  multisearchable against: [:customer_number, :customer_address_details]

  pg_search_scope :search_full_text, against: [], associated_against: {
    address: :address_details,
  },
  using: {
    tsearch: {
      prefix: true,
      negation: true,
      any_word: true
    }
  }

  # Virtual Attributes
  def customer_number
    address.address_number
  end

  # Alias for backward compatiblity
  def customer_address_details
    address.address_details
  end

  def address_number_match_code
    "#{address.address_line}"
  end
end
