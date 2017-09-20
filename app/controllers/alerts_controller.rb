class AlertsController < ApplicationController
  before_action :all_alerts, only: [:index,:dashboard]
  before_action :set_alert, only: [:show, :edit, :update, :destroy]
  before_action :new_alert, only: [:index, :new]

  def search
    @crypto = HTTParty.get("https://api.coinmarketcap.com/v1/ticker/")
  end

  def index
    @alerts = current_user.alerts
  end

  def create
  @alert = Alert.new(alert_params)
   if @alert.save!
    redirect_to user_alerts_path(@alert), :notice => "Alert created!" 
  else 
      render 'new'
   end
  end

def new
    @currency = params[:currency]
    @currency_value = params[:currency_value]
  end
  
  def edit
  end

  def show
  end

  def update
    if @alert.update(alert_params)
      @alert.user=current_user  
      redirect_to user_alerts_path(current_user), :notice => "Alert Updated!" 
    else
      render 'edit'
    end
  end

  def destroy
      @alert.destroy(alert_params)
      # @alert.user=current_user  
      redirect_to alerts_url, :notice => "Alert Deleted!"
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
    params.require(:alert).permit(:alert, :created_at, :currency, :currency_value,:start_value, :min_new, :max_new, :time_value, :time_interval, :direction,:user_id)
  end

end
