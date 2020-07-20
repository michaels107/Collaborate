# Created 7/20/2020 by Reema Gupta
# Validation rules for insertions into Grroup table
class Group < ApplicationRecord
  validates :group_name, presence: true, uniqueness: true,
            length: { maximum: 150 }
  validates :num_of_teammates, presence: true, numericality:{only_integer: true, greater_than_or_equal_to: 2}


end
