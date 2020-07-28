class ApartOfsController < ApplicationController
  def add_student_to_group
    student = EnrolledIn.find_by(student_id: params[:student_id], course_id: params[:course_id])
    redirect_to apart_of_path(params[:id]) if ApartOf.new(student_id: student.id, group_id: params[:id]).save
  end
end
