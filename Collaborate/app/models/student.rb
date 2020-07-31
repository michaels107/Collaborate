# Created 7/20/2020 by Reema Gupta
# Edited 7/21/2020 by Duytan Tran: removed email constraints
# Edited 7/22/2020 by Duytan Tran: added association to peer_Evaluations
# Validation rules for insertions into Student table
class Student < ApplicationRecord
  belongs_to :account
  validates :account_id, presence: true, uniqueness: true
  validates :f_name, length: { maximum: 255 }, presence: true
  validates :l_name, length: { maximum: 255 }, presence:true
  validates :dot_name, length: { maximum: 100 }, presence:true, uniqueness: true
  validates :rating, inclusion: "A".."F"
  has_many :peer_evaluations
end
