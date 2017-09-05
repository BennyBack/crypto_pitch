namespace :alerts do
  desc "User can receive alert based on MAX_NEW value"
  task min: :environment do
    # check for expiration
    @alerts = Alert.all#get a random alert
    send_to = @alerts.each do |alert|
      unless alert.expired?
        present_value = alert.get_value('price_usd').to_f
        new_percent_delta = ((present_value - alert.currency_value)/alert.currency_value)* 100
        if (alert.direction == "up" && new_percent_delta > alert.min_new) || (alert.direction == "down" && new_percent_delta < alert.min_new)
          puts "Don't send text"
          phone = User.select(:phone_number).find(alert.user_id)
          alert.send_message(phone, 'Test')                    
       end
end
end
send_to.each do |x|
  x.send_message(x['phone_number'], 'Test')
end
end

end

