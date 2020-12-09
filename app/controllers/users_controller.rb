class UsersController < ApplicationController
  def new
    @user=User.new
  end
  
  def create
    pass = BCrypt::Password.create(params[:password])
    p pass
    @user= User.new(email:params[:email], password: pass)
    pr = Profile.new(
      name: params[:email]
    )
    @user.profile = pr
    if @user.save
    redirect_to login_login_path
    else
      render'new'
    end
  end
end
