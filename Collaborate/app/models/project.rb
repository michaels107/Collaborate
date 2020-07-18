# frozen_string_literal: true

# Created 7/18/2020 by Duytan Tran
# Validation rules for insertions into Project table
class Project < ApplicationRecord
  validates :project_name, presence: true,
                           length: { maximum: 100 }
  validates :project_id, presence: true,
                         uniqueness: true,
                         numericality: { greater_than_or_equal_to: 0 }
  validates :description, length: { maximum: 255 }
end
