require 'rails_helper'

RSpec.describe EntryTime, type: :model do
  it { should belong_to(:user) }
  it { should validate_presence_of(:recordEntry) }
end
