# Created 7/25/2020 by Duytan Tran
# Controller for managing projects for a particular course
class ProjectsController < ApplicationController
  # Created 7/25/2020 by Duytan Tran
  # Provides new project form with instance
  def new
    @project = Project.new
    @project.course_id = params[:course_id]
  end

  # Created 7/25/2020 by Duytan Tran
  # Inserts new project into projects table
  def create
    params.permit!
    @project = Project.new(params[:project])
    redirect_to project_path(@project.course_id) if @project.save
  end

  # Created 7/25/2020 by Duytan Tran
  # Prepare edits page for a project
  def edit
    @project = Project.find(params[:id])
  end

  # Created 7/25/2020 by Duytan Tran
  # Updates with edited information a project
  def update
    params.permit!
    @project = Project.find(params[:id])
    redirect_to project_path(@project.course_id) if @project.update(params[:project])
  end

  # Created 7/25/2020 by Duytan Tran
  # Deletes the designated project from the displayed projects
  def destroy
    @project = Project.find(params[:project_id])
    @project.destroy
    redirect_to project_path(params[:course_id])
  end
end
