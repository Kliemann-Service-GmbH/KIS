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

require 'test_helper'

class GasTypeTest < ActiveSupport::TestCase
  def setup
    @gas_type = create(:gas_type)
  end

  test 'valid gas_type' do
    assert @gas_type.valid?, 'Factory is invalid'
  end

  # Validations
  test 'unique name' do
    @gas_type = build(:gas_type)
    assert_not @gas_type.valid?, 'gas_type with same name already present'
    assert_not_nil @gas_type.errors[:name], 'saved gas_type with same name'
  end

  test 'unique chemical_formula' do
    gas_type_copy = @gas_type.dup
    assert_not gas_type_copy.valid?, 'gas_type with same chemical_formula already present'
    assert_not_nil gas_type_copy.errors[:chemical_formula], 'saved gas_type with same chemical_formula'
  end

  # Test Virtual Attributes
  test 'name with formula' do
    @gas_type.name = "Factory Gas"
    @gas_type.chemical_formula = "FaG"
    assert_equal @gas_type.name_with_formula, "Factory Gas (FaG)"
  end

  test 'name with formula with only name set' do
    @gas_type.name = "Factory Gas"
    @gas_type.chemical_formula = nil
    assert_equal @gas_type.name_with_formula, "Factory Gas"
  end

  test 'name with formula with only chemical_formula set' do
    @gas_type.name = nil
    @gas_type.chemical_formula = "FaG"
    assert_equal @gas_type.name_with_formula, "(FaG)"
  end

  test 'name with formula without name or chemical_formula set' do
    @gas_type.name = nil
    @gas_type.chemical_formula = nil
    assert_not @gas_type.valid?, 'saved gas_type without a name or chemical_formula'
    assert_not_nil @gas_type.errors[:central_device], 'no validation error for gas_type present'
  end

end
