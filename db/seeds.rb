# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

password = "password"
@store_crypto_name_and_value = Alert.find_currency

sleep 10
20.times do |x|
  User.create(
    "first_name": Faker::Name.unique.name.split(" ").first,
    "last_name": Faker::Name.unique.name.split(" ").last,
    "email": Faker::Internet.email,
    "profile_pic": "http://via.placeholder.com/600x400",
    "phone_number": Faker::PhoneNumber.phone_number,
    "password": "password",
    "password_digest": BCrypt::Password.create("password"))
end

users = User.all
users.each do |user|
  time_interval = ['Hour[s]','Day[s]','Week[s]'].sample
      Alert.create(
      user_id: user.id,
      currency: @store_crypto_name_and_value['name'],
      currency_value: @store_crypto_name_and_value['price'],
      min_new: (@store_crypto_name_and_value['price'].to_f),
      # min_new: (@store_crypto_name_and_value['price'].to_f * 0.8).round(2),
      max_new: (@store_crypto_name_and_value['price'].to_f),
      # max_new: (@store_crypto_name_and_value['price'].to_f * 1.2).round(2),
      time_interval:time_interval,
      time_value: Alert.get_time_value(time_interval)
      )
end
puts "Seed file complete"

