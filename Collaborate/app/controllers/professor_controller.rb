# Created 7/22/2020 by Duytan Tran
# Controller for the professor page for a particular professor who is logged in
class ProfessorController < ApplicationController

  # Created 7/22/2020 by Duytan Tran
  # Displays all courses currently associated with logged in professor
  def index
    course_ids = TaughtBy.where(professor_id: current_account.id).pluck :course_id
    @taught_courses = Course.where id: course_ids
  end

  # Created 7/22/2020 by Duytan Tran
  # Inserts new course into Course table and TaughtBy tables
  def create
    params.permit!
    @course = Course.new(params[:course])
    if @course.save
      TaughtBy.new(professor_id: current_account.id, course_id: Course.last.id).save
      redirect_to professor_index_path
    end
  end

  # Created 7/22/2020 by Duytan Tran
  # Provides new course form with instance
  def new
    @course = Course.new
  end

  def edit
  end

  def destroy
  end

  def projects
  end

  def groups
  end
end
