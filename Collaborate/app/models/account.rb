# frozen_string_literal: true

# Created 7/18/2020 by Duytan Tran
# Devise model for user accounts
class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :professors
  has_many :students
end
