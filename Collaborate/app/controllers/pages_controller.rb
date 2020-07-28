# Created 7/26/2020 by Sean Michaels
# Edited 7/27/2020 by Duytan Tran: added redirect if professor is signed in
# Controller for managing student view of courses
class PagesController < ApplicationController
  def student_home
    if Professor.exists? account_id: current_account.id
      redirect_to courses_path
      return
    end
    # Courses enrolled in controller code
    @student = Student.find_by(account_id: current_account.id)
    course_ids = EnrolledIn.where(student_id: @student.id).pluck :course_id
    @enrolled_in = Course.where id: course_ids

    # Groups apart of controller code
    group_ids = ApartOf.where(student_id: @student.id).pluck :group_id
    @apart_of = Group.where id: group_ids
  end
end
