class UsersController < ApplicationController
  def new
    @user=User.new
  end
  
  def create
    user= User.new(email:params[:email],password:params[:password])
    user.save
    redirect_to '/login/index'
  end
end
