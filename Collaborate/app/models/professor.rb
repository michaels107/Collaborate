# frozen_string_literal: true

# Created 7/18/2020 by Duytan Tran
# Edited 7/21/2020 by Duytan Tran: removed email constraints
# Validation rules for insertions into Professor table
class Professor < ApplicationRecord

  belongs_to :account
  validates :account_id, presence: true, uniqueness: true
  validates :first_name, length: { maximum: 255 }
  validates :last_name, length: { maximum: 255 }

end
