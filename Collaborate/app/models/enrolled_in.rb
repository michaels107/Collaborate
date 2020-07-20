# frozen_string_literal: true

# Created 7/20/2020 by Caroline Wheeler
# Validation rules for insertions into enrolled_in table
class EnrolledIn < ApplicationRecord
  belongs_to :student
  belongs_to :course
  validates :student_id, presence: true, uniqueness: true
  validates :course_id, presence: true, uniqueness: true
end