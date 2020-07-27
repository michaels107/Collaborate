# Created 7/20/2020 by Reema Gupta
# Edited 7/22/2020 by Duytan Tran: swapped foreign key relationship with projects
# Edited 7/23/2020 by Duytan Tran: added uniqueness for section number
# Validation rules for insertions into Course table
class Course < ApplicationRecord
  has_many :projects
  has_many :groups
  has_many :taught_bies
  validates :section_num, presence: true,
            numericality: {only_integer: true},
            uniqueness: true
  validates :course_name, presence: true
  validates :course_number, presence: true
end
