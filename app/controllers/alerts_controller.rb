class AlertsController < ApplicationController
  before_action :all_alerts, only: [:index]
  before_action :set_alert, only: [:show, :edit, :update, :destroy]
  before_action :new_alert, only: [:index, :new]

  def index
    @crypto = HTTParty.get("https://api.coinmarketcap.com/v1/ticker/?limit=5")
  end

  def create
  #  @alert = current_user.alerts.build(alert_params)
  # binding.pry
  @alert = Alert.new(alert_params)
  @alert.user = current_user
   if @alert.save
    redirect_to user_alerts_path(current_user, @alert), notice: 'Task was successfully created.'
   end
  end

  def new
  end
   
  def show
  end

  def update
    if @alert.update(alert_params)
      redirect_to user_alerts_path
    end
  end

  private

  def set_alert
    @alert = Alert.find(params[:id])
  end

  def new_alert
    @alert = Alert.new(params[:id])
  end

  def all_alerts
    @alerts = Alert.all
  end
  
  def alert_params
    params.require(:alert).permit(:time, :currency, :start_value, :min_new, :max_new, :time_value, :time_interval)
  end
end
