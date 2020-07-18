# frozen_string_literal: true

# Created 7/18/2020 by Duytan Tran
# Project table migrations
class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :project_name
      t.integer :project_id
      t.string :description

      t.timestamps
    end
  end
end
