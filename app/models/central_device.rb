class CentralDevice < ApplicationRecord
  # Associations
  belongs_to :service_object

  has_many :accus, dependent: :destroy
  has_many :alarm_settings, dependent: :destroy
  has_many :sensors, dependent: :destroy
  has_many :service_protocols, dependent: :destroy


  # Validations
  # validates :device_number, presence: true

  # Nested Attributes
  # accepts_nested_attributes_for :sensors, allow_destroy: true, reject_if: proc { |attr| attr['sensor_type_id'].blank? }
  accepts_nested_attributes_for :sensors, allow_destroy: true, reject_if: :all_blank
  # accepts_nested_attributes_for :accus, allow_destroy: true
  # accepts_nested_attributes_for :alarm_settings, allow_destroy: true
  # accepts_nested_attributes_for :service_protocols, allow_destroy: true


  # Full-Text search in PostgreSQL database
  include PgSearch
  multisearchable against: [:device_number, :device_type, :location]

  pg_search_scope :search_full_text, against: [:device_number, :device_type, :location],
    using: {
      tsearch: {
        prefix: true,
        negation: true,
        any_word: true
      }
    }

end
