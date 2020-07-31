# Created 7/27/2020 by Reema Gupta
# Edited 7/28/2020 by Reema Gupta
# Edited 7/31/2020 by Duytan Tran: Rubocop changes
# Controller for student enrollment in a group
class ApartOfsController < ApplicationController
  # Edited 7/28/2020 by Reema Gupta
  # method for adding student to  a group
  def add_student_to_group
    student = Student.find_by dot_name: params[:dot_name].downcase
    group = Group.find_by id: params[:id]
    return unless EnrolledIn.exists?(student_id: student.id, course_id: group.course_id)

    redirect_to apart_of_path(params[:id]) if ApartOf.new(student_id: student.id, group_id: params[:id]).save
  end

  # Edited 7/28/2020 by Reema Gupta
  # method for removing student from a group
  def destroy
    @apart_of = ApartOf.find_by(student_id: params[:student_id], group_id: params[:group_id])
    @apart_of.destroy
    redirect_to apart_of_path(params[:group_id])
  end
end
