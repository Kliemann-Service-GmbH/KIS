# == Schema Information
#
# Table name: central_devices
#
#  id                :bigint           not null, primary key
#  accu_montage_date :datetime
#  device_number     :string           default("0")
#  device_type       :string
#  has_accu          :boolean
#  location          :string
#  montage_date      :datetime
#  serial_number     :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  service_object_id :bigint
#
# Indexes
#
#  index_central_devices_on_service_object_id  (service_object_id)
#

class CentralDevice < ApplicationRecord
  # Associations
  belongs_to :service_object

  has_many :alarm_outputs, dependent: :destroy, inverse_of: :central_device
  has_many :alarm_settings, dependent: :destroy, inverse_of: :central_device
  has_many :history_entries, dependent: :destroy, inverse_of: :central_device
  has_many :output_devices, dependent: :destroy, inverse_of: :central_device
  has_many :sensors, dependent: :destroy, inverse_of: :central_device


  # Validations
  validates :device_type, presence: true
  validate :status

  # Nested Attributes
  accepts_nested_attributes_for :alarm_outputs, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :alarm_settings, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :history_entries, allow_destroy: true, reject_if: proc { |attr| attr['entry'].blank? }
  accepts_nested_attributes_for :output_devices, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :sensors, allow_destroy: true, reject_if: :all_blank

  # Full-Text search in PostgreSQL database
  include PgSearch::Model
  multisearchable against: [:serial_number, :device_type, :location]

  pg_search_scope :search_full_text, against: [:serial_number, :device_type, :location],
    using: {
      tsearch: {
        prefix: true,
        negation: true,
        any_word: true
      }
    }

  # Virtual Attributes
  def object_device_number
    "#{service_object.object_number}-#{device_number}"
  end

  # Custom Validation function
  def status
    errors.add(I18n.t(:status), I18n.t('status_ok_and_status_not_ok_are_exclusive')) if status_ok && status_not_ok
  end
end
