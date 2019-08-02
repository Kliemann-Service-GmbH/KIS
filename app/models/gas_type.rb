class GasType < ApplicationRecord
  # Associations
  has_many :sensors, dependent: :destroy
  # Validations
  validates :name, uniqueness: true
  validates :chemical_formula, uniqueness: true

  validate :name_or_chemical_formula_present

  # Virtual Attributes
  def name_with_formula
    if name.blank?
      name
    else
      "#{name} (#{chemical_formula})"
    end
  end

  def name_or_chemical_formula_present
    errors.add(I18n.t(:name_or_chemical_formula), I18n.t("need to be entered")) if name.blank? && chemical_formula.blank? 
  end
end
