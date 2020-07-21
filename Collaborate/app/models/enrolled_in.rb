# frozen_string_literal: true

# Created 7/20/2020 by Caroline Wheeler
# Validation rules for insertions into EnrolledIn table
class EnrolledIn < ApplicationRecord
  belongs_to :student
  belongs_to :course
  validates :id, presence: true, uniqueness: true
end
