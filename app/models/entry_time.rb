class EntryTime < ApplicationRecord
  belongs_to :user
  validates_presence_of :recordEntry
end
