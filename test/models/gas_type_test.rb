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
  end

  test 'valid gas_type' do
    @gas_type = create(:gas_type)
    assert @gas_type.valid?, 'Factory is invalid'
  end

  # Validations
  test 'unique name' do
    @gas_type = create(:gas_type, name: 'GasTyp-123')
    gas_type_copy = @gas_type.dup
    assert_not gas_type_copy.valid?, 'gas_type with same name already present'
    assert_not_nil gas_type_copy.errors[:name], 'saved gas_type with same name'
  end

  test 'unique chemical_formula' do
    @gas_type = create(:gas_type, chemical_formula: 'GT-123')
    gas_type_copy = @gas_type.dup
    assert_not gas_type_copy.valid?, 'gas_type with same chemical_formula already present'
    assert_not_nil gas_type_copy.errors[:chemical_formula], 'saved gas_type with same chemical_formula'
  end

  test 'invalid without name or chemical_formula' do
    @gas_type = build(:gas_type_only_name, name: nil, chemical_formula: nil)
    assert_not @gas_type.valid?, 'saved gas_type without a name or chemical_formula'
    assert_not_nil @gas_type.errors[:central_device], 'no validation error for gas_type present'
  end

  # Test Virtual Attributes
  test 'name with formula' do
    @gas_type = create(:gas_type)
    assert_equal @gas_type.name_with_formula, "#{@gas_type.name} (#{@gas_type.chemical_formula})"
  end

  test 'name with formula while only name set' do
    @gas_type = create(:gas_type_only_name)
    assert_equal @gas_type.name_with_formula, @gas_type.name
  end

  test 'name with formula while only chemical_formula set' do
    @gas_type = create(:gas_type_only_chemical_formula)
    assert_equal @gas_type.name_with_formula, "(#{@gas_type.chemical_formula})"
  end
end
