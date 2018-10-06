FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    password { Faker::Internet.password }
    name { Faker::Name.first_name }
    lastName { Faker::Name.last_name }
    docId { Faker::IDNumber.spanish_citizen_number }
    phone { Faker::PhoneNumber.cell_phone }
    address { Faker::Address.full_address }
    admin { 0 }

    factory :user_employee do
        email { Faker::Internet.unique.email }
        password { Faker::Internet.password }
        name { Faker::Name.first_name }
        lastName { Faker::Name.last_name }
        docId { Faker::IDNumber.spanish_citizen_number }
        phone { Faker::PhoneNumber.cell_phone }
        address { Faker::Address.full_address }
        admin { 1 }
    end
  end
end
