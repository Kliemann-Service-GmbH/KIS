class SiUnit < ApplicationRecord
  # Associations
  has_many :sensors, dependent: :destroy

  # Validations
end
