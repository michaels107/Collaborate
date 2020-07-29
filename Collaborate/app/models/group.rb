# Created 7/20/2020 by Reema Gupta
# Edited 7/22/2020 by Duytna Tran: added association to peer_evaluations
# Validation rules for insertions into Group table
class Group < ApplicationRecord
  validates :group_name, presence: true, uniqueness: true,
            length: { maximum: 150 }
  validates :num_of_teammates, presence: true, numericality:{only_integer: true, greater_than_or_equal_to: 2}
  belongs_to :course
  has_many :associateds
end
