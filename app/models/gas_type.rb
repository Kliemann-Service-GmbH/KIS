# == Schema Information
#
# Table name: gas_types
#
#  id               :bigint           not null, primary key
#  chemical_formula :string
#  description      :text
#  name             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class GasType < ApplicationRecord
  # Associations
  has_many :sensors, dependent: :destroy, inverse_of: :gas_type

  # Validations
  validates :name, uniqueness: true, allow_blank: true
  validates :chemical_formula, uniqueness: true
  validate :name_or_chemical_formula_present

  # Virtual Attributes
  def name_with_formula
    return if name.blank? && chemical_formula.blank?
    if name.blank?
      "(#{chemical_formula})"
    elsif chemical_formula.blank?
      "#{name}"
    else
      "#{name} (#{chemical_formula})"
    end
  end

  # Custom Validation function
  def name_or_chemical_formula_present
    errors.add(I18n.t(:name_or_chemical_formula), I18n.t("need to be entered")) if name.blank? && chemical_formula.blank?
  end
end
