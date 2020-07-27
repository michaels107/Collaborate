class PagesController < ApplicationController
  def student_home
    @student = Student.find_by(account_id: current_account.id)
    course_ids = EnrolledIn.where(student_id: @student.id).pluck :course_id
    @enrolled_in= Course.where id: course_ids
  end
end
