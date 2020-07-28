class CreateAssociateds < ActiveRecord::Migration[5.2]
  def change
    create_table :associateds do |t|
      t.references :group, foreign_key: true
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
