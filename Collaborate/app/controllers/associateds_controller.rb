# Created 7/29/2020 by Reema Gupta
# Edited 7/29/2020 by Reema Gupta
# Controller for project in a group

# Edited 7/29/2020 by Reema Gupta
# method for adding project to  a group
class AssociatedsController < ApplicationController
  def add_project_to_group
    project= Project.find_by project_name: params[:project_name].downcase
    group=Group.find_by id: params[:id]
    if Project.exists?(course_id: group.course_id)
      redirect_to associated_path(params[:id]) if Associated.new(project_id: project.id, group_id: params[:id]).save
    end
  end

  # Edited 7/29/2020 by Reema Gupta
  # method for deleting project from a group
    def destroy
      @associated = Associated.find_by(project_id: params[:project_id], group_id: params[:group_id])
      @associated.destroy
      redirect_to associated_path(params[:group_id])
    end
  end
