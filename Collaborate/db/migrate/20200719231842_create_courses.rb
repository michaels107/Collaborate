class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.integer :section_num
      t.string :course_name
      t.string :course_number
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
