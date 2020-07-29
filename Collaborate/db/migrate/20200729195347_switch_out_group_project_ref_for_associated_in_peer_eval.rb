class SwitchOutGroupProjectRefForAssociatedInPeerEval < ActiveRecord::Migration[5.2]
  def change
    remove_column :peer_evaluations, :group
    remove_column :peer_evaluations, :project
    add_reference :peer_evaluations, :associated, index: true
  end
end
