class ContactAddress < ApplicationRecord
  # Associations
  belongs_to :address
  has_many :object_maintenances, dependent: :destroy

  # Validations
  validates :address, presence: true

end
