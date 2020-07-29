# Created 7/27/2020 by Reema Gupta
# Controller for the group page

class GroupsController < ApplicationController

  # Created 7/27/2020 by Reema Gupta
  # Provides new group form with instance
  def new
    @group=Group.new
    @group.course_id = params[:course_id]
  end

  # Created 7/27/2020 by Reema Gupta
  # Deletes the group
  def destroy
    @group = Group.find(params[:group_id])
    @group.destroy
    redirect_to group_path(params[:course_id])
  end

  # Created 7/27/2020 by Reema Gupta
  # Provides edit group form with instance
  def edit
    @group =Group.find(params[:id])
  end

  # Created 7/27/2020 by Reema Gupta
  # Insert new group
  def create
    params.permit!

    @group =Group.new(params[:group])
    redirect_to group_path(@group.course_id) if @group.save
  end
  # Created 7/27/2020 by Reema Gupta
  # Provides edit group form with instance
  def update
    params.permit!
    @group = Group.find(params[:id])
    redirect_to group_path(@group.course_id) if @group.update(params[:group])
  end
  # Created 7/27/2020 by Reema Gupta
  # Prepares view for enrollments in a particular group
  def view_students_in_group
    student_ids = ApartOf.where(group_id: params[:id]).pluck :student_id
    @enrolled=Student.where id:student_ids
    @groups = Group.find(params[:id])
    render 'apart_ofs/show'
  end
  # Created 7/27/2020 by Reema Gupta
  # Prepares view for projects in a particular course
  def view_projects_in_group
    project_ids=Associated.where(group_id: params[:id]).pluck :project_id
    @projects=Project.where id:project_ids
    @groups = Group.find(params[:id])
    render 'associateds/show'
  end
end
