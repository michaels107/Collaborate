class RemoveRoleFromPeerEval < ActiveRecord::Migration[5.2]
  def change
    remove_column :peer_evaluations, :role
  end
end
