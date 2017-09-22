require 'bigdecimal/util'

namespace :alerts do
  desc "User can receive alert based on MAX_NEW value"
  task min: :environment do
    @alerts = Alert.all
    @alerts.each do |alert|
      unless alert.expired?
        present_value = alert.get_value('price_usd').to_d
        new_percent_delta = alert.percent_changed
        if (alert.direction == "up" && new_percent_delta > alert.min_new) || (alert.direction == "down" && new_percent_delta < alert.min_new)
          alert.send_message("#{alert.currency} is currently #{alert.direction} by #{new_percent_delta}%")          
        end
      end
     end
   end
end