class CreateTa < ActiveRecord::Migration[5.2]
  def change
    create_table :ta do |t|
      t.references :account_id, foreign_key: true
      t.string :f_name
      t.string :l_name

      t.timestamps
    end
  end
end
