class LoginController < ApplicationController
    def index
        
    end
    
    def login
        # パスワードがあっているかどうかとか
        
    end
    
    def logout
        # セッションを削除する処理
        
        redirect_to login_path
    end
end
