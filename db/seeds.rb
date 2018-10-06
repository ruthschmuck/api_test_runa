# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: 'myemail@mail.com',
            password_digest: BCrypt::Password.create('123456'),
            name: Faker::Name.first_name,
            lastName: Faker::Name.first_name,
            docId: Faker::IDNumber.spanish_citizen_number,
            phone: Faker::PhoneNumber.cell_phone,
            address: Faker::Address.full_address,
            admin: 0)
