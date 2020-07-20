class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :dot_name
      t.string :f_name
      t.string :l_name
      t.string :rating
      t.string :student_email
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
