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

  #Checks interval set by user and sets an expiration interval
  def self.expiration_timestamp(time_interval, time_value)
    case time_interval
      when "hours" then @expiration_timestamp = Time.now + time_value.hours
      when 'days' then @expiration_timestamp = Time.now + time_value.days
      when 'weeks' then @expiration_timestamp = Time.now + time_value.weeks
    end
  end
  # Using the expiration_timestamp, compared aainst the present to determine if the alert has expired
  def self.expired?(expiration)
    if expiration && (Time.now  > expiration)
       return true
    else
      return false
    end
  end
  
  # gets the current value of the alert by querying the name of cryptocurrency
  def self.get_value(name,value)
    @crypto = (HTTParty.get("https://api.coinmarketcap.com/v1/ticker/#{name}/")).parsed_response 
    @crypto[0][value]
    end
    
  def self.check_percentage(percent,alert)
    case percent
      when "days" then return  Alert.get_value( alert,'percent_change_24h')
      when "weeks" then  Alert.get_value(alert, 'percent_change_7d')
      when "hours" then Alert.get_value(alert, 'percent_change_1h')
    end
  end 

 
  def self.max_text_check(max,delta,original)
    # add delta to @cumulative
    @cumulative += delta
    #if cumulative is <= max
    if @cumulative <= max
      return true
    else
      return false
    end
  end
  
  def self.min_text_check(min, delta,original)
    # add delta to @cumulative
    @cumulative += delta    
    #if cumulative is >= min 
    if @cumulative >= min
            return true
    else
      return false
    end
      #send text
  end 


  
end
