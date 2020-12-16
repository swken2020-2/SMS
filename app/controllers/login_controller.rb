class LoginController < ApplicationController
    def login_form
      render :login
    end
    
    def login
      if User.authenticate(params[:uid], params[:pass])
        session[:login_uid] = User.find_by(email: params[:uid]).id
        redirect_to '/main/index'
      else
        flash.now[:notice] = "メールアドレス、またはパスワードが違います"
        render 'index'
      end

    end# パスワードがあっているかどうかとか
    
    def logout
        session.delete(:login_uid)
        # セッションを削除する処理
        
        flash[:type] = 'info'
        flash[:message] = 'ログアウトしました'
        flash[:stay] = false
        flash[:position] = 'top'
        flash[:time] = 5
        flash[:func] = 'alert'
        
        redirect_to login_path
    end
end
