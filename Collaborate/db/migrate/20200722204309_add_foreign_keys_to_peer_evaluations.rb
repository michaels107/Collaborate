class AddForeignKeysToPeerEvaluations < ActiveRecord::Migration[5.2]
  def change
    add_reference :peer_evaluations, :group, index:true
    add_reference :peer_evaluations, :student, index:true
  end
end
