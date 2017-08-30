# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

password = "password"

20.times do |x|
  User.create!(
    "name": Faker::Name.name,
    "email": Faker::Internet.email,
    "phone_number": Faker::PhoneNumber.phone_number,
    "password": "password",
    "password_confirmation": "password",
    )
  end
  
  20.times do
    Alert.create!(
    "time": Time.now,
    "currency": Alert.find_currency,
    'start_value': Alert.find_start_value
    )
  end

puts "Seed file complete"