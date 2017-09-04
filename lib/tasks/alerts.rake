namespace :alerts do
  desc "User can receive alert based on MAX_NEW value"
  task min: :environment do
    @user = User.all.sample
    @user_name = @user.first_name + " " + @user.last_name
    @user.alerts.each do |alert|
      future_interval  = alert.time_value.to_s + " " + alert.time_interval
       puts "The users name is #{@user_name}"
       puts "User created at alert at #{alert.created_at}"
       puts "The cryptocurrency for which the alert is created is #{alert.currency}"
       puts "The current value of  #{alert.currency} is #{alert.currency_value}"
       puts "The alert should be sent if the value rises to #{alert.max_new} at any point between #{alert.created_at} and #{future_interval} from now"
      end

      
      end

  desc "TODO"
  task max: :environment do
  end

end