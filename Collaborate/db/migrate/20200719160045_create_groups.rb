class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :group_name
      t.integer :num_of_teammates

      t.timestamps
    end
  end
end
