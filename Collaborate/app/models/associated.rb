# Created 7/28/2020 by Sean Michaels
# Validation rules for insertions into Associated table
class Associated < ApplicationRecord
  belongs_to :group
  belongs_to :project
  has_many :peer_evaluations
end
