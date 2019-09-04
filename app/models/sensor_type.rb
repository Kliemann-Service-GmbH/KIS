# == Schema Information
#
# Table name: sensor_types
#
#  id                :bigint           not null, primary key
#  default_livetime  :datetime
#  default_max_value :decimal(, )
#  default_min_value :decimal(, )
#  name              :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class SensorType < ApplicationRecord
  # Associations
  has_many :sensors, dependent: :destroy, inverse_of: :sensor_type

  # Validations
  validates :name, presence: true, uniqueness: true
end
