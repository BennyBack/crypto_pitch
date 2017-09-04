namespace :alerts do
  desc "User can receive alert based on MAX_NEW value"
  task min: :environment do
    # check for expiration
    alerts = Alert.all #get all alerts
    @alert = alerts.last #get a random alert
    expiration_interval = Alert.expiration_timestamp(@alert.time_interval, @alert.time_value)
    unless @alert.expired?
            present_value = @alert.get_value('price_usd')
             new_percent_delta = ((present_value - @alert.currency_value)/@alert.currency_value)* 100
             if (@alert.direction == "up" && new_percent_delta > @alert.min_new) || (@alert.direction == "down" && new_percent_delta < @alert.min_new)
              puts "Send text"
             else
              puts "Don't send text"
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
