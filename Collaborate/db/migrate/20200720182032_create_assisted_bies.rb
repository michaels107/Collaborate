class CreateAssistedBies < ActiveRecord::Migration[5.2]
  def change
    create_table :assisted_bies do |t|
      t.references :professor, foreign_key: true
      t.references :ta, foreign_key: true

      t.timestamps
    end
  end
end
