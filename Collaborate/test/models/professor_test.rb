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
                               f_name: 'Bob',
                               l_name: 'Smith'
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

  # f_name constraints testing
  test 'f_name should not exceed 255 characters' do
    @professor.f_name = 'a' * 256
    assert_not @professor.valid?
  end

  # f_name constraints testing
  test 'l_name should not exceed 255 characters' do
    @professor.l_name = 'a' * 256
    assert_not @professor.valid?
  end

end
