class UsersController < ApplicationController
  include UsersHelper
  
  def new
    @user=User.new
  end
  
  def create
    pass = BCrypt::Password.create(params[:password])
    type = 0
    type = 2 if User.all.count == 0
    @user= User.new(email:params[:email], password: pass)

    pr = Profile.new(
      name: params[:email],
      role: type
    )
    
    @user.profile = pr
    if @user.save
      redirect_to login_login_path
    else
      render'new'
    end
  end
  
  def edit
    pi = params[:id]
    
    if !User.hasPermission2EditProfile(getUserId, pi) then
      redirect_to root_path
      return
    end
    
    @user = User.find(pi)
  end
end
