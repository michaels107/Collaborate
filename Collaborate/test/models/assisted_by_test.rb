# Created 7/19/2020 by Sean Michaels
# Edited 7/21/2020 by Duytan: fixed setup
# Testing for AssistedBy table data manipulation
require 'test_helper'

class AssistedByTest < ActiveSupport::TestCase
  #Test Setups
  def setup
    Account.new(email:'bob@gmail.com', password:'password').save
    Professor.new(account_id: Account.last.id,
                  first_name: 'Bobby',
                  last_name: 'Fisher').save
    Account.new(email:'jerry@gmail.com', password:'password').save
    Ta.new(account_id: Account.last.id, f_name: 'Donald',
           l_name: 'Glover').save
    @AssistedBy = AssistedBy.new professor_id: Professor.last.id, ta_id: Ta.last.id

  end

  test 'validity' do
    assert @AssistedBy.valid?
  end

  test 'valid professor' do
    @AssistedBy.professor_id = -2
    assert_not @AssistedBy.valid?
  end

  test 'valid peer' do
    @AssistedBy.ta_id = -2
    assert_not @AssistedBy.valid?
  end
end
