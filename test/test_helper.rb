require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
ENV['RAILS_ENV'] ||= 'test'
class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  def is_logged_in?
    !session[:user_id].nil?
  end

    # Log in as a particular user.
    def log_in_as(user)
      session[:user_id] = user.id
    end

    # Random assigns alerts to users
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
    # 24 Hours in a day
    when "hours" then time_value= Random.rand(1..24) 
    # 7 Days a week
    when 'days' then time_value= Random.rand(1..7) 
    # 4 Weeks in a month
    when 'weeks' then time_value= Random.rand(1..4) 
    end
end

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
    
    # Log in as a particular user.
    def log_in_as(user, password: 'password', remember_me: '1')
      post login_path, params: { session: { email: user.email,
                                            password: password,
                                            remember_me: remember_me } }
    end
  end
