class Alert < ApplicationRecord
  belongs_to :user

  def self.find_currency
    @currency = []
    @crypto = HTTParty.get("https://api.coinmarketcap.com/v1/ticker/?limit=20")
    @crypto.each do |result|
      opts = {}
      opts['price']=result['price_usd']
      opts['name']=result['name']
      @currency.push(opts)
    end
    return @currency
  end

  def self.find_start_value
    @currency_value = []
    @crypto = HTTParty.get("https://api.coinmarketcap.com/v1/ticker/")
    @crypto.each do |result|
      @currency_value.push(result['price_usd'])
    end
    return @currency_value.sample
  end

end
