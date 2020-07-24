class DropAssistedBiesAndTa < ActiveRecord::Migration[5.2]
  def change
    drop_table :Assisted_Bies
    drop_table :Ta
  end
end
