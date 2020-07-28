# Created 7/27/2020 by Reema Gupta
# Controller for the group page
class GroupsController < ApplicationController
  def new
    @group=Group.new
    @group.course_id = params[:course_id]
  end
#display all the group in the course

  def destroy
    @group = Group.find(params[:group_id])
    @group.destroy
    redirect_to group_path(params[:course_id])
  end
  def edit
    @group =Group.find(params[:id])
  end
  def create
    params.permit!
    @group =Group.new(params[:group])
    redirect_to group_path(@group.course_id) if @group.save
  end
  def update
    params.permit!
    @group = Group.find(params[:id])
    redirect_to group_path(@group.course_id) if @group.update(params[:group])
  end

  def view_students_in_group
    student_ids = ApartOf.where(group_id: params[:id]).pluck :student_id
    @enrolled = Student.where id: student_ids
    @groups = Group.find(params[:id])
    render 'apart_ofs/show'
  end
end
