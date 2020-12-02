class LoginController < ApplicationController
    
    def login
      if User.authenticate(params[:email],params[:password])
      session[:login_uid] = params[:password]
      redirect_to root_path
      else
      render :error
      end
    end# パスワードがあっているかどうかとか
    
    def logout
        session.delete(:login_uid)
        # セッションを削除する処理
        
        redirect_to login_path
    end
end
