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

class ServiceObject < ApplicationRecord
  # Associations
  belongs_to :customer
  belongs_to :address

  has_many :object_maintenances, dependent: :destroy, inverse_of: :service_object
  has_many :contact_addresses, through: :object_maintenances, dependent: :destroy
  has_many :central_devices, dependent: :destroy, inverse_of: :service_object

  # Validations
  validates :address, presence: true
  validates :customer, presence: true

  validates :address, uniqueness: { scope: :customer,
    message: I18n.t("Object with such a customer address combination already exists.") }
  # TODO: test central_device presence
  # validates :central_device, presence: true
  # Custom Validations
  validate :service_contract_end_cant_be_in_the_past_if_begin_is_in_future #9 & 11
  validate :service_contract_auto_resume_interval_cant_set_without_the_other_fields #18

  # Nested Attributes
  # accepts_nested_attributes_for :central_device

  # Full-Text search in PostgreSQL database
  include PgSearch::Model
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

  # Custom Validation methods
  def service_contract_end_cant_be_in_the_past_if_begin_is_in_future
    if (!service_contract_begin.nil? && service_contract_begin > Time.now) &&
      (!service_contract_end.nil? && service_contract_end < Time.now) &&
      (service_contract_auto_resume_interval.nil? || service_contract_auto_resume_interval)
      errors.add(:service_contract_end, I18n.t("End can't be in the past if the service contracts begin starts in the future"))
    end
  end

  def service_contract_auto_resume_interval_cant_set_without_the_other_fields
    if service_contract_auto_resume_interval && service_contract_begin.nil? && service_contract_end.nil?
      errors.add(:service_contract_auto_resume_interval, I18n.t("Auto resume can't be set without a valid begin or end"))
    end
  end

  # Virtual Attributes
  def has_service_contract
    return false if service_contract_begin.nil? && service_contract_end.nil? && service_contract_auto_resume_interval.nil? #17
    return false if service_contract_begin.nil? && service_contract_end.nil? && service_contract_auto_resume_interval #18 unreachable #
    return true if service_contract_begin.nil? && service_contract_end > Time.now && service_contract_auto_resume_interval.nil? #13
    return false if service_contract_begin.nil? && service_contract_end < Time.now && service_contract_auto_resume_interval.nil? #16
    return true if service_contract_begin.nil? && service_contract_end > Time.now && service_contract_auto_resume_interval #14
    return true if service_contract_begin.nil? && service_contract_end < Time.now && service_contract_auto_resume_interval #15
    return false if service_contract_begin > Time.now && service_contract_end.nil? && service_contract_auto_resume_interval.nil? #1
    return true if service_contract_begin < Time.now && service_contract_end.nil? && service_contract_auto_resume_interval.nil? #2
    return false if service_contract_begin > Time.now && service_contract_end.nil? && service_contract_auto_resume_interval #3
    return true if service_contract_begin < Time.now && service_contract_end.nil? && service_contract_auto_resume_interval #4
    return false if service_contract_begin > Time.now && service_contract_end > Time.now && service_contract_auto_resume_interval.nil? #5
    return true if service_contract_begin < Time.now && service_contract_end > Time.now && service_contract_auto_resume_interval.nil? #6
    return false if service_contract_begin > Time.now && service_contract_end < Time.now && service_contract_auto_resume_interval.nil? #9 unreachable #
    return false if service_contract_begin < Time.now && service_contract_end < Time.now && service_contract_auto_resume_interval.nil? #10
    return false if service_contract_begin > Time.now && service_contract_end > Time.now && service_contract_auto_resume_interval #7
    return true if service_contract_begin < Time.now && service_contract_end > Time.now && service_contract_auto_resume_interval #8
    return false if service_contract_begin > Time.now && service_contract_end < Time.now && service_contract_auto_resume_interval #11 unreachable #
    return true if service_contract_begin < Time.now && service_contract_end < Time.now && service_contract_auto_resume_interval #12

    # Default false
    false
  end

  def service_contract_length
    return nil unless has_service_contract

    return service_contract_end if service_contract_begin.nil? && service_contract_end > Time.now && service_contract_auto_resume_interval.nil? #13
    return service_contract_end if service_contract_begin.nil? && service_contract_end > Time.now && service_contract_auto_resume_interval #14
    return Time.now.end_of_year if service_contract_begin.nil? && service_contract_end < Time.now && service_contract_auto_resume_interval #15
    return Time.now.end_of_year if service_contract_begin < Time.now && service_contract_end.nil? && service_contract_auto_resume_interval.nil? #2
    return Time.now.end_of_year if service_contract_begin < Time.now && service_contract_end.nil? && service_contract_auto_resume_interval #4
    return service_contract_end if service_contract_begin < Time.now && service_contract_end > Time.now && service_contract_auto_resume_interval.nil? #6
    return service_contract_end if service_contract_begin < Time.now && service_contract_end > Time.now && service_contract_auto_resume_interval #8
    return Time.now.end_of_year if service_contract_begin < Time.now && service_contract_end < Time.now && service_contract_auto_resume_interval #12

  end

  # TODO: Add usage
  # used in:
  # *
  def object_number
    address.address_number
  end

  # TODO: Add usage
  # used in:
  # *
  def customer_number
    customer.customer_number
  end

  # TODO: Add usage
  # used in:
  # *
  def address_details
    address.address_details
  end

end
