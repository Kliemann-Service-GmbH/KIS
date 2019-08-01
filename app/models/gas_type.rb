class GasType < ApplicationRecord
  # Associations
  has_many :sensors, dependent: :destroy
  # Validations
  validates :name, uniqueness: true
  validates :chemical_formula, uniqueness: true


  # Virtual Attributes
  def name_with_formula
    if name.blank?
      name
    else
      "#{name} (#{chemical_formula})"
    end
  end
end
