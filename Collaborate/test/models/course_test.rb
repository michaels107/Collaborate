require 'test_helper'
# Created 7/20/2020 by Reema Gupta
# Testing for Course table data manipulation
class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  # Created 7/20/2020 by Reema Gupta
  # Initial valid form of a project formatted for insertion in Course table
  def setup
    Project.new(project_name: 'Project_1', description: 'Do something').save
    @course= Course.new project_id: Project.last.id,
                         section_num: 324567,
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
  # project_id constraints testing
  test 'project_id should be present' do
    @course.project_id = '         '
    assert_not @course.valid?
  end

  test 'project_id should exist' do
    @course.project_id = -2
    assert_not @course.valid?
  end


end
