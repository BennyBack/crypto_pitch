class Alert < ApplicationRecord
  belongs_to :user
  @@expiration_date


  def self.find_currency
    @currency = []
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
  def self.expiration_interval(interval)
    case interval
      when "hours" then @@expiration_interval = interval
      when 'days' then @@expiration_interval = interval
      when 'weeks' then @@expiration_interval = interval 
    end
  end
  
end
