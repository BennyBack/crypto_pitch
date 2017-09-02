# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

password = "password"

20.times do |x|
  u =User.create!(
    "first_name": Faker::Name.unique.name.split(" ").first,
    "last_name": Faker::Name.unique.name.split(" ").last,
    "email": Faker::Internet.email,
    "phone_number": Faker::PhoneNumber.phone_number,
    "password": "password",
    "password_digest": BCrypt::Password.create("password")
    )
  end

User.create!(
  "first_name": 'Z',
  "last_name": 'S',
  "email": 'zannain@wyncode.co',
  "phone_number": Faker::PhoneNumber.phone_number,
  "password": "password",
  "password_digest": BCrypt::Password.create("password")
)
puts "Seed file complete"