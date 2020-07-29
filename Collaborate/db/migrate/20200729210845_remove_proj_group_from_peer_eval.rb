class RemoveProjGroupFromPeerEval < ActiveRecord::Migration[5.2]
  def change
    remove_column :peer_evaluations, :group_id
    remove_column :peer_evaluations, :project_id
  end
end
