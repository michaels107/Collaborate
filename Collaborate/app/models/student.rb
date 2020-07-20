# Created 7/20/2020 by Reema Gupta
# Validation rules for insertions into Student table
class Student < ApplicationRecord
  belongs_to :account
  validates :account, presence:true
  validates :account_id, presence: true, uniqueness: true
  validates :student_email, presence: true, uniqueness: true
  validate :student_matching_email?
  validates :f_name, length: { maximum: 255 }, presence: true
  validates :l_name, length: { maximum: 255 } , presence:true
  validates :dot_name, length: { maximum: 100 }, presence:true, uniqueness: true
  validates :rating, inclusion: "A".."F"


def student_matching_email?
  !Account.find_by(email: student_email).nil? && Account.find_by(email: student_email).id == account_id
end
end