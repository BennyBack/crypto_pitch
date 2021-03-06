class UsersController < ApplicationController
    before_action :logged_in_user, only: [:edit, :update]
    before_action :correct_user, only: [:edit, :update]
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
        log_in @user
        redirect_to root_path, :notice => 'Alert was successfully created.' 
    else
        render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
      if @user.update_attributes(user_params)
          redirect_to @user, :notice => "Success Updated Profile" 
      else
          render 'edit'
      end
  end

  private 

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone_number, :password, :password_confirmation, :profile_pic)
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
end
