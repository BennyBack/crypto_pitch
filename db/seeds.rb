# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

password = "password"
User.create(
  "first_name": Faker::Name.unique.name.split(" ").first,
  "last_name": Faker::Name.unique.name.split(" ").last,
  "email": "step@gmail.com",
  "profile_pic": "http://via.placeholder.com/600x400",
  "phone_number": Faker::PhoneNumber.phone_number,
  "password": "password",
  "password_digest": BCrypt::Password.create("password"))
  
  5.times do |x|
    @store_crypto_name_and_value = Alert.find_currency
    sleep 10
    time_interval = ['hours','days','weeks'].sample
      Alert.create( 
      user_id: 1,
      currency: @store_crypto_name_and_value['name'],
      currency_value: @store_crypto_name_and_value['price'],
      min_new: (@store_crypto_name_and_value['price'].to_f),
      max_new: (@store_crypto_name_and_value['price'].to_f),
      time_interval:time_interval,
      time_value: Alert.get_time_value(time_interval)
      )
end
puts "Seed file complete"
