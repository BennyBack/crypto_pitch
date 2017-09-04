class AlertsController < ApplicationController
  before_action :all_alerts, only: [:index,:dashboard]
  before_action :set_alert, only: [:show, :edit, :update, :destroy]
  before_action :new_alert, only: [:index, :new]

  def search
    @crypto = HTTParty.get("https://api.coinmarketcap.com/v1/ticker/?limit=5")
  end

  def index
  end

<<<<<<< HEAD
  def dashboard

  end

=======
>>>>>>> 374830fd155254bbdc27154ba3685d38e7f884af
  def create
  @alert = Alert.new(alert_params)
  @alert.user = current_user
   if @alert.save
    redirect_to user_alerts_path(current_user, @alert)
    flash[:success] = "Alert created!"
   end
  end

  def new
    @currency = params[:currency]
    @currency_value = params[:currency_value]
    # @currency = params(:currency).permit(:currency, :currency_value)
<<<<<<< HEAD
  end
=======
  end  
    
>>>>>>> 374830fd155254bbdc27154ba3685d38e7f884af
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
    params.require(:alert).permit(:alert_time, :currency, :currency_value,:start_value, :min_new, :max_new, :time_value, :time_interval)
  end
end
