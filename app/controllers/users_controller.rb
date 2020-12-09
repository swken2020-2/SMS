class UsersController < ApplicationController
  def new
    @user=User.new
  end
  
  def create
    pass = BCrypt::Password.create(params[:password])
    type = 0
    type = 2 if User.all.count == 0
    user= User.new(email:params[:email], password: pass)
    pr = Profile.new(
      name: params[:email],
      role: type
    )
    user.profile = pr
    user.save
    redirect_to login_login_path
  end
end
