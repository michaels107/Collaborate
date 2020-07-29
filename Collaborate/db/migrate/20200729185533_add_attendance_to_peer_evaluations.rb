class AddAttendanceToPeerEvaluations < ActiveRecord::Migration[5.2]
  def change
    add_column :peer_evaluations, :attendance, :string
  end
end
