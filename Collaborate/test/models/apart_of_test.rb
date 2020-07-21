# Created 7/19/2020 by Sean Michaels
# Testing for ApartOf table data manipulation
require 'test_helper'

class ApartOfTest < ActiveSupport::TestCase
  #Test Setups
  def setup
    Student.new(account_id: 500,
                student_email: 'smichaels@gmail.com',
                f_name: 'Sean',
                l_name: 'Michaels',
                dot_name:'michaels.107',
                rating:'A').save
    Group.new(group_name: 'Quaranteam',
              num_of_teammates: '4').save
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
