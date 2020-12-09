class LoginController < ApplicationController
    
    def login
        if User.authenticate(params[:uid], params[:pass])
            u = User.find_by(email: params[:uid])
            session[:login_uid] = u.id
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
