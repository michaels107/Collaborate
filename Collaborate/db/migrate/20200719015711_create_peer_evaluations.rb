class CreatePeerEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :peer_evaluations do |t|
      t.string :project_role
      t.string :content
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
