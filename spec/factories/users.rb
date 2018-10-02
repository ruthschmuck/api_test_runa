FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password_digest { Faker::Internet.password }
    name { Faker::Name.first_name }
    lastName { Faker::Name.first_name }
    docId { Faker::IDNumber.spanish_citizen_number }
    phone { Faker::PhoneNumber.cell_phone }
    address { Faker::Address.full_address }
    admin { false }
  end
end
