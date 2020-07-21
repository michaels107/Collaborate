# frozen_string_literal: true

# Created 7/20/2020 by Caroline Wheeler
# Validation rules for insertions into TA table
class Ta < ApplicationRecord
  belongs_to :account
  validates :id, presence: true, uniqueness: true
  validates :f_name, length: { maximum: 255 }, presence: true
  validates :l_name, length: { maximum: 255 }, presence: true
end
