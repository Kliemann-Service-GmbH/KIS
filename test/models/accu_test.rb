# == Schema Information
#
# Table name: accus
#
#  id                :bigint           not null, primary key
#  application_date  :datetime
#  livetime          :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  central_device_id :bigint
#
# Indexes
#
#  index_accus_on_central_device_id  (central_device_id)
#

require 'test_helper'

class AccuTest < ActiveSupport::TestCase
  def setup
    @accu = accus(:baroness)
  end

  test 'valid accu' do
    assert @accu.valid?, 'Fixture baroness is invalid'
  end
end
