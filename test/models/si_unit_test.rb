require 'test_helper'

class SiUnitTest < ActiveSupport::TestCase
  def setup
    @si_unit = si_units(:baroness)
  end

  test 'valid si_unit' do
    assert @si_unit.valid?, 'Fixture baroness is invalid'
  end
end
