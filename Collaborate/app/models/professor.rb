# frozen_string_literal: true

# Created 7/18/2020 by Duytan Tran
# Validation rules for insertions into Professor table
class Professor < ApplicationRecord

  belongs_to :account
  validates :account_id, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validate :matching_email?
  validates :first_name, length: { maximum: 255 }
  validates :last_name, length: { maximum: 255 }

  # Created 7/18/2020 by Duytan Tran
  # Checks to see if given email is present in accounts and that it is attached to the correct id
  def matching_email?
    !Account.find_by(email: email).nil? && Account.find_by(email: email).id == account_id
  end

end
