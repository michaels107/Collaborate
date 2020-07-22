# frozen_string_literal: true

# Created 7/18/2020 by Duytan Tran
# Validation rules for insertions into PeerEvaluation table
class PeerEvaluation < ApplicationRecord
  belongs_to :project
  belongs_to :student
  belongs_to :group
  validates :project_role, length: { maximum: 255 }
  validates :content, length: { maximum: 6000 }, presence: true
  validates :project_id, presence: true, uniqueness: true
end
