# == Schema Information
#
# Table name: si_units
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class SiUnitTest < ActiveSupport::TestCase
  def setup
    @si_unit = create(:si_unit)
  end

  test 'valid si_unit' do
    assert @si_unit.valid?, 'Factory is invalid'
  end
end
