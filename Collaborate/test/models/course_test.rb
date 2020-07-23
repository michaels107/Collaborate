require 'test_helper'
# Created 7/20/2020 by Reema Gupta
# Edited 7/22/2020 by Duytan Tran: removed constraints testing for project_id
# Testing for Course table data manipulation
class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  # Created 7/20/2020 by Reema Gupta
  # Initial valid form of a project formatted for insertion in Course table
  def setup
    @course = Course.new section_num: 324567,
                         course_name: 'Web Applications',
                         course_number:'CSE 3901'
  end
  test 'should be valid' do
    assert @course.valid?
  end
  # section number constraints testing
  test 'section number must exist' do
    @course.section_num = nil
    assert_not @course.valid?
  end
  # course name constraints testing
  test 'course name must exist' do
    @course.course_number = nil
    assert_not @course.valid?
  end
  # course number constraints testing
  test 'course number must exist' do
    @course.course_name = nil
    assert_not @course.valid?
  end

end
