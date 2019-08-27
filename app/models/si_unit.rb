# == Schema Information
#
# Table name: si_units
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class SiUnit < ApplicationRecord
  # Associations
  has_many :sensors, dependent: :destroy

  # Validations
  validates :name, presence: true, uniqueness: true
end
