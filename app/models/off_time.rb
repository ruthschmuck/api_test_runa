class OffTime < ApplicationRecord
  belongs_to :user
  validates_presence_of :recordOff
end
