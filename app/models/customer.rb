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

class Customer < ApplicationRecord
  # Associations
  belongs_to :address

  has_many :service_objects, dependent: :destroy, inverse_of: :customer

  # Validations
  validates :address, presence: true

  # Full-Text search in PostgreSQL database
  include PgSearch::Model
  multisearchable against: [:customer_number, :address_details]

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
  def address_details
    address.address_details
  end

  def address_line
    "#{address.address_line}"
  end
end
