# frozen_string_literal: true

# Created 7/18/2020 by Duytan Tran
# Edited 7/21/2020 by Duytan: removed email from @professor
# Testing for Professors table data manipulation
require 'test_helper'

# Tests constraints imposed on Professors table
class ProfessorTest < ActiveSupport::TestCase
  # Created 7/18/2020 by Duytan Tran
  # Initial valid form of a project formatted for insertion in Professors table
  def setup
    Account.new(email: 'testUser@gmail.com', password: 'password').save
    @professor = Professor.new account_id: Account.last.id,
                               first_name: 'Bob',
                               last_name: 'Smith'
  end

  test 'should be valid' do
    assert @professor.valid?
  end

  # Account_id constraints testing
  test 'account_id should be present' do
    @professor.account_id = '   '
    assert_not @professor.valid?
  end

  test 'account_id should not be nil' do
    @professor.account_id = nil
    assert_not @professor.valid?
  end

  test 'account_id should exist in accounts' do
    @professor.account_id = -2
    assert_not @professor.valid?
  end

  # first_name constraints testing
  test 'first_name should not exceed 255 characters' do
    @professor.first_name = 'a' * 256
    assert_not @professor.valid?
  end

  # last_name constraints testing
  test 'last_name should not exceed 255 characters' do
    @professor.first_name = 'a' * 256
    assert_not @professor.valid?
  end

end
