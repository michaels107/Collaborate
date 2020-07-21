# Created 7/19/2020 by Sean Michaels
# Validation rules for insertions into Give table
class Give < ApplicationRecord
  belongs_to :peer_evaluation
  belongs_to :student
  validates :student_id, presence: true;
  validates :peer_evaluation_id, presence: true;

end
