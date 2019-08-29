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

  has_many :accus, dependent: :destroy
  has_many :alarm_settings, dependent: :destroy
  has_many :sensors, dependent: :destroy
  has_many :service_protocols, dependent: :destroy


  # Validations
  validates :device_type, presence: true

  # Nested Attributes
  # accepts_nested_attributes_for :sensors, allow_destroy: true, reject_if: proc { |attr| attr['sensor_type_id'].blank? }
  accepts_nested_attributes_for :sensors, allow_destroy: true, reject_if: :all_blank
  # accepts_nested_attributes_for :accus, allow_destroy: true
  # accepts_nested_attributes_for :alarm_settings, allow_destroy: true
  # accepts_nested_attributes_for :service_protocols, allow_destroy: true


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

end
