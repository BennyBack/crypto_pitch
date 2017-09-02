class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email(params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      redirect_to @user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
  end
  
  private
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

end
