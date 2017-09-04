namespace :alerts do
  desc "User can receive alert based on MAX_NEW value"
  task min: :environment do
    @user = User.all.sample
    @user_name = @user.first_name + " " + @user.last_name
    @alert = @user.alerts.first
    @user.alerts.each do |alert|
      future_interval  = alert.time_value.to_s + " " + alert.time_interval
       puts "The users name is #{@user_name}"
       puts "User created at alert at #{alert.created_at}"
       puts "The cryptocurrency for which the alert is created is #{alert.currency}"
       puts "The current value of  #{alert.currency} is #{alert.currency_value}"
       puts "The alert should be sent if the value rises to #{alert.max_new} at any point between #{alert.created_at} and #{future_interval} from now"
      end
      
      # Create a method that sets expiration based on the user provided interval
      @expiration_date = Alert.expiration_timestamp(@alert.time_interval, @alert.time_value)
      puts "expiration date for this alert will be #{@expiration_date}"
      # Creat a method taht checks if the alert has expired
      @expired = Alert.expired?(@expiration_date)
      if @expired
        puts "Yes this alert is expired"
      else
        puts "Yes this alert is active"
      end

    end
  task max: :environment do
  end

end


# namespace :crypto do
#   desc "Alert user cypto prices"
#   task alert: :environment do
#     # current_user => have a min_price_alert of $5
#     # current_user => have a max_price_alert of $50
#     # current_user => hhave a max_timestamp # I want you to notifiy me before this date?
#     # now you make a api call to get the current price
#     # current_price_of_that_crypto = $15

#     # if (current_price_of_that_crypto <= current_uer.min_price_alert
#     #    || current_price_of_that_crypto >= current_user.max_price_alert) && Time.zone.now <= current_user.max_timestamp
#     #    # here you send the alert
#     # end
#   end

# end