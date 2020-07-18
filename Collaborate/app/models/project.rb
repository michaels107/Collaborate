# frozen_string_literal: true

# Created 7/18/2020 by Duytan Tran
# Validation rules for insertions into Project table
class Project < ApplicationRecord
  validates :project_name, presence: true,
                           length: { maximum: 100 }
  validates :description, length: { maximum: 255 }
end
