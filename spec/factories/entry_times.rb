FactoryBot.define do
  factory :entry_time do
    entry = Faker::Time.between(1.year.ago, Date.today,
                                :morning).to_s.split(' ')
    recordEntry { entry[1] }
    user { 1 }
  end
end
