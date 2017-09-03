class Alert < ApplicationRecord
  belongs_to :user

  def self.find_currency
    @currency = []
    @crypto = HTTParty.get("https://api.coinmarketcap.com/v1/ticker/?limit=5")
    rand_int = Random.rand(1..5)
    opts = {}
    opts['price']=@crypto[rand_int]['price_usd']
    opts['name']=@crypto[rand_int]['name']
    return opts
  end

  def self.get_time_value(interval)
    
    case interval
    when "Hour[s]" then time_value= Random.rand(1..24)
    when 'Day[s]' then time_value= Random.rand(1..7)
    when 'Week[s]' then time_value= Random.rand(1..4)
    end
  end

end
