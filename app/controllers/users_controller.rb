class UsersController < ApplicationController
  def new
    @user=User.new
  end
  
  def create
    p = BCrypt::Password.create(params[:passwprd])
    user= User.new(email:params[:email], password: p)
    pr = Profile.new(
      name: params[:email]
    )
    user.profile = pr
    user.save
    redirect_to login_login_path
  end
end
