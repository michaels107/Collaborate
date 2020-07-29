class ModifyPeerEvaluationAttributesToReflectForm < ActiveRecord::Migration[5.2]
  def change
    remove_column :peer_evaluations, :content
    add_column :peer_evaluations, :participation, :string
    add_column :peer_evaluations, :contribution, :string
    add_column :peer_evaluations, :time, :string
    add_column :peer_evaluations, :team, :string
    add_column :peer_evaluations, :general, :string
  end
end
