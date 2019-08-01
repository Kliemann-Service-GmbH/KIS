require 'test_helper'

class AccuTest < ActiveSupport::TestCase
  def setup
    @accu = accus(:baroness)
  end

  test 'valid accu' do
    assert @accu.valid?, 'Fixture baroness is invalid'
  end
end
