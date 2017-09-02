class UsersController < ApplicationController
    before_action :set_user, only: :show

    def index 
    end

    
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            log_in @user
            flash[:success] = "Account Created, Welcome!"
            redirect_to @user
        else
            render 'new'
        end
    end
    
    
    def show
    end

    private
    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :phone_number, :password, :password_confirmation)
    end

end
