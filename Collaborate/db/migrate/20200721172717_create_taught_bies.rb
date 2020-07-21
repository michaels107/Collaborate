class CreateTaughtBies < ActiveRecord::Migration[5.2]
  def change
    create_table :taught_bies do |t|
      t.references :professor_id, foreign_key: true
      t.references :course_id, foreign_key: true

      t.timestamps
    end
  end
end
