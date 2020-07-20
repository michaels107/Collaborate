# Created 7/20/2020 by Reema Gupta
# Validation rules for insertions into Course table
class Course < ApplicationRecord
  belongs_to :project
  validates :project_id, presence: true, uniqueness: true
  validates :section_num, presence: true, numericality:{only_integer: true}
  validates :course_name, presence: true
  validates :course_number, presence: true
end
