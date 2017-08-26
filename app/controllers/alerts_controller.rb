class AlertsController < ApplicationController

  def index
    @crypto = HTTParty.get("https://api.coinmarketcap.com/v1/ticker/")
  end

end
