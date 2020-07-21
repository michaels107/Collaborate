class CreateEnrolledIns < ActiveRecord::Migration[5.2]
  def change
    create_table :enrolled_ins do |t|
      t.references :student_id, foreign_key: true
      t.references :course_id, foreign_key: true

      t.timestamps
    end
  end
end
