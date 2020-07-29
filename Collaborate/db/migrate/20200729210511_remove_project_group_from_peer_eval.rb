class RemoveProjectGroupFromPeerEval < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :peer_evaluations, :groups
    remove_foreign_key :peer_evaluations, :projects
  end
end
