require 'test_helper'

# Created 7/20/2020 by Reema Gupta
# Testing for Student table data manipulation
class StudentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  # Tests constraints imposed on Student table
  def setup
    # Created 7/20/2020 by Reema Gupta
    # Initial valid form of a project formatted for insertion in Student table
    Account.new(email: 'testStudent@gmail.com', password: 'pass1234').save
    @student= Student.new account_id: Account.last.id,
                           student_email: Account.last.email,
                               f_name: 'kavya',
                               l_name: 'Khan',
                               dot_name:'khan.121',
                               rating:'A'

  end

  test 'valid test' do
    assert @student.valid?
  end
  # Account_id constraints testing
  test 'account_id should be present' do
    @student.account_id = '   '
    assert_not @student.valid?
  end
  test 'account_id should not be nil' do
    @student.account_id = nil
    assert_not @student.valid?
  end
  test 'account_id should exist in accounts' do
    @student.account_id = -2
    assert_not @student.valid?
  end

  # student email constraints testing
  test 'email should be present' do
    @student.student_email = '    '
    assert_not @student.valid?
  end

  test 'email should not be nil' do
    @student.student_email = nil
    assert_not @student.valid?
  end

  # first_name constraints testing
  test 'first_name should not exceed 255 characters' do
    @student.f_name = 'a' * 256
    assert_not @student.valid?
  end

  test 'first name should not be nil' do
    @student.f_name = nil
    assert_not @student.valid?
  end

  # last_name constraints testing
  test 'last_name should not exceed 255 characters' do
    @student.l_name = 'a' * 256
    assert_not @student.valid?
  end

  test 'last name should not be nil' do
    @student.l_name = nil
    assert_not @student.valid?
  end
  # name.number constraints testing
  test 'name.number should not be nil' do
    @student.dot_name= nil
    assert_not @student.valid?
  end
  test 'name.number should not exceed 100 characters' do
    @student.dot_name = 'a' * 101
    assert_not @student.valid?
  end
  # Rating constraints testing
  test 'Rating should not be an alphabet greater than F' do
    @student.rating = 'G'
    assert_not @student.valid?
  end

  test 'Rating should be an alphabet from A to F' do
    @student.rating = 'B'
    assert @student.valid?
  end


  end

