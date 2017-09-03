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
    "first_name": Faker::Name.unique.name.split(" ").first,
    "last_name": Faker::Name.unique.name.split(" ").last,
    "email": Faker::Internet.email,
    "profile_pic": "http://via.placeholder.com/600x400",
    "phone_number": Faker::PhoneNumber.phone_number,
    "password": "password",
    "password_digest": BCrypt::Password.create("password"),)

end
  # User.create!
  #   "first_name": 'Z',
  #   "last_name": 'S',
  #   "email": 'zannain@wyncode.co',
  #   "profile_pic": "http://via.placeholder.com/600x400",
  #   "phone_number": Faker::PhoneNumber.phone_number,
  #   "password": "password",
  #   "password_digest": BCrypt::Password.create("password")
  # )
  #
  # users = User.all
  # user.each do |user|
  #   5.times do
  #     Alert.create(
  #       user_id: user.id,
  #       currency: Alert.find_currency.sample['name'],
  #       currency_value: Alert.find_currency.sample['price'].to_i
  #       min_new: Alert.find_currency.sample['price'].to_i + Random.rand(501...1000)
  #       max_new: Alert.find_currency.sample['price'].to_i + Random.rand(1...500),
  #       )
  #   end
  # end
  #
  #
  # puts "Seed file complete"
