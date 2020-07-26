# Created 7/25/2020 by Duytan Tran
# Controller for managing student enrollment in a particular course
class EnrolledInsController < ApplicationController
  # Created 7/25/2020 by Duytan Tran
  # Enrolls a new student into the displayed course based on name.num
  def enroll_student
    params.permit!
    student = Student.find_by dot_name: params[:dot_name].downcase
    redirect_to enrolled_in_path(params[:id]) if EnrolledIn.new(student_id: student.id, course_id: params[:id]).save
  end

  # Created 7/25/2020 by Duytan Tran
  # Drops the designated student from the displayed course
  def destroy
    @enrolled_in = EnrolledIn.find_by(student_id: params[:student_id], course_id: params[:course_id])
    @enrolled_in.destroy
    redirect_to enrolled_in_path(params[:course_id])
  end
end
