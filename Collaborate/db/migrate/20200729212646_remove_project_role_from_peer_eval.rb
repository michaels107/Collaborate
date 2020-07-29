class RemoveProjectRoleFromPeerEval < ActiveRecord::Migration[5.2]
  def change
    remove_column :peer_evaluations, :project_role
  end
end
