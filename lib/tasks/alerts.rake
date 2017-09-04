namespace :alerts do
  desc "User can receive alert based on MAX_NEW value"
  task min: :environment do
    # check for expiration
    alerts = Alert.all #get all alerts
    @alert = alerts.last #get a random alert
    expiration_interval = Alert.expiration_timestamp(@alert.time_interval, @alert.time_value)
    expiration_date = Alert.expiration_timestamp(@alert.time_interval,@alert.time_value)
    @expired = Alert.expired?(expiration_date)
    unless @expired
          users = User.all #taking all users
      @user = users.last #randomly taking a user
            username = @user. first_name + " " + @user.last_name #user name
            present_value = Alert.get_value(@alert.currency, 'price_usd')
            @alert.currency_value.to_f
             new_percent_delta = Alert.check_percentage(@alert.time_interval,@alert.currency)
             send_max = Alert.max_text_check(@alert.max_new,new_percent_delta.to_f, @alert.currency)
             if send_max
              puts "Send max test"
             else
              puts "Don't send max text"
             end
              send_min = Alert.min_text_check(@alert.min_new, new_percent_delta.to_f,@alert.currency)
              if send_min
                puts "Send min text"
              else
                puts "Don't send min text"
              end
    end
  end
  
  
  # end
  # end
  
  #    puts "The users name is #{username}"
  #    puts "User created at alert at #{@alert.created_at}"
  #    puts "The cryptocurrency for which the alert is created is #{@alert.currency}"
  #    puts "The current value of  #{@alert.currency} is #{@alert.currency_value}"
  #    puts "The alert should be sent if the value RISES #{@alert.max_new} percent at any point between #{@alert.created_at} and #{expiration_date} from now"
  #    puts "OR"
  #    puts "The alert should be sent if the value DROPS #{@alert.min_new} percent at any point between #{@alert.created_at} and #{expiration_date} from now"
  #   end
  
  # end
  desc "User can receive alert based on MAX_NEW value"
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