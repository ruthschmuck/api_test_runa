FactoryBot.define do
  factory :off_time do
    off = Faker::Time.between(DateTime.now - 1, DateTime.now).to_s.split(' ')
    recordOff { off[1] }
    user { '1' }
  end
end
