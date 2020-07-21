# Created 7/19/2020 by Sean Michaels
# Testing for AssistedBy table data manipulation
require 'test_helper'

class AssistedByTest < ActiveSupport::TestCase
  #Test Setups
  def setup
    Professor.new(account_id: 400,
                  email: 'smichaels@gmail.com',
                  first_name: 'Bobby',
                  last_name: 'Fisher').save
    TA.new(email: 'Quaranteamtestemail@gmail.com', first_name: 'Donald',
        last_name: 'Glover').save
    @AssistedBy = AssistedBy.new professor_id: Professor.last.id, ta_id: TA.last.id

  end

  test 'validity' do
    assert @ApartOf.valid?
  end

  test 'valid professor' do
    @ApartOf.professor_id = -2
    assert_not @ApartOf.valid?
  end

  test 'valid peer' do
    @ApartOf.ta_id = -2
    assert_not @ApartOf.valid?
  end
end
