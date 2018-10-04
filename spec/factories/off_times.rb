FactoryBot.define do
  factory :off_time do
    off = Faker::Time.between(1.year.ago, Date.today,
                              :afternoon).to_s.split(' ').to_s.split(' ')
    recordOff { off[1] }
    user { 1 }
  end
end
