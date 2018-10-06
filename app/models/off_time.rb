class OffTime < ApplicationRecord
  belongs_to :user
  validates :recordOff, presence: true, length: { minimum: 8, maximum: 8 }
end
