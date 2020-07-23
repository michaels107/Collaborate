class Switch < ActiveRecord::Migration[5.2]
  def change
    remove_column :courses, :project_id
    add_reference :projects, :course, index:true
  end
end
