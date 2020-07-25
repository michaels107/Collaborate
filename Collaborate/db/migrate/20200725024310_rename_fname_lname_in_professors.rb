class RenameFnameLnameInProfessors < ActiveRecord::Migration[5.2]
  def change
    rename_column :professors, :first_name, :f_name
    rename_column :professors, :last_name, :l_name
  end
end
