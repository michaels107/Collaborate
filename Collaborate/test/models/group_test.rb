require 'test_helper'
# Created 7/20/2020 by Reema Gupta
# Testing for Group table data manipulation
class GroupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  #  Created 7/20/2020 by Reema Gupta
  #   Initial valid form of a project formatted for insertion in Group table
  def setup
    Course.new(section_num: 12345, course_name: 'Mathematics 22', course_number: 1123).save
    @group = Group.new group_name: 'Quaranteam',
                      num_of_teammates: '6',
                      course_id: Course.last.id
  end

  test 'should be valid' do
    assert @group.valid?
  end
  # group name constraints testing
  test 'group_name should be present' do
    @group.group_name = '     '
    assert_not @group.valid?
  end

  test 'group_name should not be nil' do
    @group.group_name  = nil
    assert_not @group.valid?
  end

  test 'group_name should not be more than 150 characters' do
    @group.group_name = 'a' * 151
    assert_not @group.valid?
  end
  # number of teammates constraints testing
  test ' num_of_teammates should not be less than 2 ' do
    @group.num_of_teammates = 0
    assert_not @group.valid?
  end
  test ' num_of_teammates should be a number greater than 2 ' do
    @group.num_of_teammates = 3
    assert @group.valid?
  end

  test 'should only be a number' do
    @group.num_of_teammates = 'a'
    assert_not @group.valid?
  end
end
