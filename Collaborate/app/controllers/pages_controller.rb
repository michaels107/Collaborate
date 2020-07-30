# Created 7/26/2020 by Sean Michaels
# Edited 7/27/2020 by Duytan Tran: added redirect if professor is signed in
# Edited 7/29/2020 by Duytan Tran: added additional check if group is nil
# Controller for managing student view of courses
class PagesController < ApplicationController
  def student_home
    if Professor.exists? account_id: current_account.id
      redirect_to courses_path
      return
    end
    # Courses enrolled in controller code
    @student = Student.find_by(account_id: current_account.id)
    course_ids = EnrolledIn.where(student_id: @student.id).pluck :course_id
    @enrolled_in = Course.where id: course_ids

    # Groups apart of controller code
    group_ids = ApartOf.where(student_id: @student.id).pluck :group_id
    @apart_of = Group.where id: group_ids


    @project = Project.where(course_id: course_ids)
    project_ids = @project.pluck :id
    @associated = Associated.where(project_id: project_ids)

    @pg = Hash.new { |h, k| h[k] = [] }
    @project.each do |project|
      associated_row = @associated.find_by project_id: project.id
      unless associated_row.nil?
        @pg[project.project_name] << Group.find(associated_row.group_id)
        @pg[project.project_name] << associated_row
      end
    end

  end

  # Edited 7/29/2020 by Reema Gupta
  # method viewing peer evaluations for a group
  def view_peer_evaluation
    @peer_evaluations = PeerEvaluation.where(associated_id: params[:id])
    render 'pages/show'
  end
end
