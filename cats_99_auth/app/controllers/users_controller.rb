class UsersController < ApplicationRecord

def new
    render :new
end 

def create
    @user = User.new(user_params)
    if user.save
        redirect_to user_url(@user)
    else
        render :new 
    end 
end 


def user_params
    params.require(:user).permit(:user_name, :password) 
end
end