# Created 7/19/2020 by Sean Michaels
# Validation rules for insertions into ApartOf table
class ApartOf < ApplicationRecord
  belongs_to :student
  belongs_to :group
  validates :student_id, presence: true;
  validates :group_id, presence: true;
end
