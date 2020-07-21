# frozen_string_literal: true

# Created 7/20/2020 by Caroline Wheeler
# Validation rules for insertions into TaughtBy table
class TaughtBy < ApplicationRecord
  belongs_to :professor
  belongs_to :course
  validates :id, presence: true, uniqueness: true
end
