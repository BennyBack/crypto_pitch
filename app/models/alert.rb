require 'bigdecimal/util'

class Alert < ApplicationRecord
  belongs_to :user
  @percentage = {
    :daily => :time,
    :weekly => :weekly,
    :hourly => :hourly
  }
  @cumulative = 0

  def self.find_currency
    @crypto = HTTParty.get("https://api.coinmarketcap.com/v1/ticker/?limit=20")
    rand_int = Random.rand(1..20)
    opts = {}
    opts['price']=@crypto[rand_int]['price_usd']
    opts['name']=@crypto[rand_int]['name']
    return opts
  end
  # Based on interval given by user this method sets limit for the value
  def self.get_time_value(interval)
    case interval
    when "hours" then time_value= Random.rand(1..24) # 24 Hours in a day
    when 'days' then time_value= Random.rand(1..7) # 7 Days a week
    when 'weeks' then time_value= Random.rand(1..4) # 4 Weeks in a month
    end
  end

#   def percent_changed
#     ((get_value('price_usd') - self.currency_value)/self.currency_value)* 100
#   end

  #Checks interval set by user and sets an expiration interval
  def expiration_timestamp
    case time_interval
      when "hours" then Time.now + time_value.hours
      when 'days' then  Time.now + time_value.days
      when 'weeks' then  Time.now + time_value.weeks
    end
  end
  # Using the expiration_timestamp, compared aainst the present to determine if the alert has expired
  def expired?
   expiration_timestamp && (Time.now > expiration_timestamp)
  end
  # gets the current value of the alert by querying the name of cryptocurrency
#   def get_value(value)
#     crypto = (HTTParty.get("https://api.coinmarketcap.com/v1/ticker/#{value}/")).parsed_response
#     # crypto[0][value].to_d
#   end

  def send_message(alert_message)
    @twilio_number = ENV['TWILIO_NUMBER']
    @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']

    @client.account.messages.create(
      :from => @twilio_number,
      :to => user.phone_number,
      :body => alert_message,
    )
  end
end
