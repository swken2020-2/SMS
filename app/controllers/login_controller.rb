class LoginController < ApplicationController
    
    def login
        p params
      if User.authenticate(params[:uid], params[:pass])
        session[:login_uid] = params[:pass]
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
