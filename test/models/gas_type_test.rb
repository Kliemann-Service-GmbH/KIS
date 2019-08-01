require 'test_helper'

class GasTypeTest < ActiveSupport::TestCase
  def setup
    @gas_type = gas_types(:baroness)
  end

  test 'valid gas_type' do
    assert @gas_type.valid?, 'Fixture baroness is invalid'
  end

  # Validations
  # test 'unique name' do
  #   @gas_type.dup
  #   assert_not @gas_type.valid?, 'saved gas_type without a name'
  #   assert_not_nil @gas_type.errors[:name], 'saved gas_type without a name'
  # end
  #
  # test 'unique chemical_formula' do
  #   @gas_type.dup
  #   assert_not @gas_type.valid?, 'saved gas_type without a chemical_formula'
  #   assert_not_nil @gas_type.errors[:chemical_formula], 'saved gas_type without a chemical_formula'
  # end
end
