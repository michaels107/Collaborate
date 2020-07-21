class CreateGives < ActiveRecord::Migration[5.2]
  def change
    create_table :gives do |t|
      t.references :peer_evaluation, foreign_key: true
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
