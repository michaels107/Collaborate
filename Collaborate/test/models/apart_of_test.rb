# Created 7/19/2020 by Sean Michaels
# Testing for ApartOf table data manipulation
require 'test_helper'

class ApartOfTest < ActiveSupport::TestCase
  #Test Setups
  def setup
    Account.new(email:'bob@gmail.com', password:'password').save
    Student.new(account_id: Account.last.id,
                f_name: 'Sean',
                l_name: 'Michaels',
                dot_name:'michaels.107',
                rating:'A').save
    Course.new(section_num: 12345, course_name: 'Mathematics 22', course_number: 1123).save
    Group.new(group_name: 'Quaranteam',
              num_of_teammates: '4', course_id: Course.last.id).save
    @ApartOf = ApartOf.new student_id: Student.last.id, group_id: Group.last.id

  end
  test 'validity' do
    assert @ApartOf.valid?
  end

  test 'valid student' do
    @ApartOf.student_id = -2
    assert_not @ApartOf.valid?
  end

  test 'valid group' do
    @ApartOf.group_id = -2
    assert_not @ApartOf.valid?
  end
end
