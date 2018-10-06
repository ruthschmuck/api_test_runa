class EntryTime < ApplicationRecord
  belongs_to :user
  validates :recordEntry, presence: true, length: { minimum: 8, maximum: 8 }
end
