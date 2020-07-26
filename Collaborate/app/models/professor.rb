# frozen_string_literal: true

# Created 7/18/2020 by Duytan Tran
# Edited 7/21/2020 by Duytan Tran: removed email constraints
# Validation rules for insertions into Professor table
class Professor < ApplicationRecord
  belongs_to :account
  has_many :taught_bies
  validates :account_id, presence: true, uniqueness: true
  validates :f_name, length: { maximum: 255 }
  validates :l_name, length: { maximum: 255 }
end
