# frozen_string_literal: true

# Created 7/20/2020 by Caroline Wheeler
# Validation rules for insertions into TA table
class TA < ApplicationRecord
  belongs_to :account
  validates :email, presence: true, uniqueness: true
  validates :first_name, length: { maximum: 255 }, presence: true
  validates :last_name, length: { maximum: 255 }, presence: true

end
