class SensorType < ApplicationRecord
  # Associations
  has_many :sensors, dependent: :destroy

  # Validations
  validates :name, presence: true
end
