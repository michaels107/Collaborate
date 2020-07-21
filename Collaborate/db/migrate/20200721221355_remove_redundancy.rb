class RemoveRedundancy < ActiveRecord::Migration[5.2]
  def change
    remove_column :professors, :email
    remove_column :students, :student_email
  end
end
