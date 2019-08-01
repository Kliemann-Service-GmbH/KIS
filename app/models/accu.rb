class Accu < ApplicationRecord
  # Associations
  belongs_to :central_device, inverse_of: :accus

  # Validations
  validates :central_device, presence: true
end
