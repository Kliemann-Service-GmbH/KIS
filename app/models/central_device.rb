# == Schema Information
#
# Table name: central_devices
#
#  id                :bigint           not null, primary key
#  device_number     :string           default("0")
#  device_type       :string
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

  has_many :accus, dependent: :destroy, inverse_of: :central_device
  has_many :alarm_settings, dependent: :destroy, inverse_of: :central_device
  has_many :sensors, dependent: :destroy, inverse_of: :central_device


  # Validations
  validates :device_type, presence: true

  # Nested Attributes
  # accepts_nested_attributes_for :sensors, allow_destroy: true, reject_if: proc { |attr| attr['sensor_type_id'].blank? }
  accepts_nested_attributes_for :sensors, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :accus, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :alarm_settings, reject_if: :all_blank, allow_destroy: true


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
end
