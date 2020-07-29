# frozen_string_literal: true

# Created 7/18/2020 by Duytan Tran
# Validation rules for insertions into PeerEvaluation table
class PeerEvaluation < ApplicationRecord
  belongs_to :student
  belongs_to :associated
end
