class ChangeColumnNames < ActiveRecord::Migration[5.2]
  def change
    rename_column :ta, :account_id_id, :account_id
    rename_column :taught_bies, :professor_id_id, :professor_id
    rename_column :taught_bies, :course_id_id, :course_id
    rename_column :enrolled_ins, :student_id_id, :student_id
    rename_column :enrolled_ins, :course_id_id, :course_id
  end
end
