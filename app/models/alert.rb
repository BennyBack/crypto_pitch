class Alert < ApplicationRecord
  belongs_to :user
  @@daily_percent = []
  @@weekly_percent = []
  @@hourly_percent = []


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

  #Checks interval set by user and sets an expiration interval
  def self.expiration_timestamp(time_interval, time_value)
    case time_interval
      when "hours" then @expiration_timestamp = Time.now + time_value.hours
      when 'days' then @expiration_timestamp = Time.now + time_value.days
      when 'weeks' then @expiration_timestamp = Time.now + time_value.weeks
    end
  end
  
  def self.record_percent_change 
    @crypto = HTTParty.get("https://api.coinmarketcap.com/v1/ticker/?limit=20")
    @crypto.each do |crypto|
      @@daily_percent.push({ name: crypto['name'], change_24h: crypto['percent_change_24h'], time: Time.now })
      @@weekly_percent.push({ name: crypto['name'], change_7d: crypto['percent_change_7d'], time: Time.now })
      @@hourly_percent.push({ name: crypto['name'], percent_change_1h: crypto['percent_change_1h'], time: Time.now })
    end
  end

  def self.check_percentage(percent)
    case percent
      when "daily" then @@daily_percent
      when "weekly" then @@weekly_percent
      when "hourly" then @@hourly_percent
    end
  end

end
