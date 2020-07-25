# Created 7/22/2020 by Duytan Tran
# Edited 7/23/2020 by Duytan Tran: implemented destroy
# Edited 7/25/2020 by Duytan Tran: Converted to CoursesController, implemented edit/update
# Controller for the course page for a particular professor who is logged in
class CoursesController < ApplicationController
  # Created 7/22/2020 by Duytan Tran
  # Displays all courses currently associated with logged in professor
  def index
    course_ids = TaughtBy.where(professor_id: current_account.id).pluck :course_id
    @taught_courses = Course.where id: course_ids
  end

  # Created 7/22/2020 by Duytan Tran
  # Provides new course form with instance
  def new
    @course = Course.new
  end

  # Created 7/22/2020 by Duytan Tran
  # Inserts new course into Course table and TaughtBy tables
  def create
    params.permit!
    @course = Course.new(params[:course])
    if @course.save
      TaughtBy.new(professor_id: current_account.id, course_id: Course.last.id).save
      redirect_to courses_path
    end
  end

  # Created 7/23/2020 by Duytan Tran
  # Deletes the desired course from the Course and TaughtBy tables
  def destroy
    @course = Course.find(params[:id])
    if @course.present?
      @taught_course = TaughtBy.find_by(course_id: @course.id)
      @taught_course.destroy if @taught_course.present?
      @course.destroy
    end
    redirect_to courses_path
  end

  # Created 7/25/2020 by Duytan Tran
  # Prepare edits page
  def edit
    @course = Course.find(params[:id])
  end

  def update
    params.permit!
    @course = Course.find(params[:id])
    redirect_to courses_path if @course.update(params[:course])
  end
end