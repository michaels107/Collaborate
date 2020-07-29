# Edited 7/27/2020 by Reema Gupta
# Controller for student enrollment in a group
class ApartOfsController < ApplicationController
  def add_student_to_group
    enrolled= Student.find_by dot_name: params[:dot_name].downcase
    stud= EnrolledIn.find_by(student_id: enrolled.id)
    redirect_to apart_of_path(params[:id]) if ApartOf.new(student_id: stud, group_id: params[:id]).save
  end

  def destroy
    @apart_of = ApartOf.find_by(student_id: params[:student_id], group_id: params[:group_id])
    @apart_of.destroy
    redirect_to apart_of_path(params[:group_id])
  end
end
