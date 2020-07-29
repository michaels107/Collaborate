class Associated < ApplicationRecord
  belongs_to :group
  belongs_to :project
  has_many :peer_evaluations
end
