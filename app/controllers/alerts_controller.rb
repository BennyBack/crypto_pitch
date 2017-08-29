class AlertsController < ApplicationController
  before_action :all_alerts, only: [:index, :create]

  def index
    @alert = Alert.new
    @crypto = HTTParty.get("https://api.coinmarketcap.com/v1/ticker/?limit=5")
  end

  def create
   @alert = current_user.alerts.build(alert_params)
   if @alert.save!
    redirect_to user_alerts_path(current_user, @alert)
   end
  end

  def new
    @alert = Alert.new
  end
   
  def show
    @alert = Alert.find(params[:id])
  end

  def update
    @alert = Alert.find(params[:id])
    if @alert.update(alert_params)
      redirect_to user_alerts_path
    end
  end

  private
  def all_alerts
    @alerts = Alert.all
  end
  
  def alert_params
    params.require(:alert).permit(:time, :currency, :start_value, :min_new, :max_new, :time_value, :time_interval)
  end
end
