FactoryBot.define do
  factory :entry_time do
    entry = Faker::Time.between(DateTime.now - 1, DateTime.now).to_s.split(' ')
    recordEntry { entry[1] }
    user { 1 }
  end
end
