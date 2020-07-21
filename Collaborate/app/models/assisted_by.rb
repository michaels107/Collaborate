# Created 7/19/2020 by Sean Michaels
# Validation rules for insertions into AssistedBy table
class AssistedBy < ApplicationRecord
  belongs_to :professor
  belongs_to :ta
  validates :professor_id, presence: true;
  validates :ta_id, presence: true;
end
