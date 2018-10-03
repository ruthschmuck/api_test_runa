require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should_not allow_value('myemail@email').for(:email) }

  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:lastName) }
  it { should validate_presence_of(:docId) }
  it { should validate_presence_of(:phone) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:admin) }
end
