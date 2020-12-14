module UsersHelper
    def getUserId
        return 0 if session[:login_uid].nil?
        return session[:login_uid].to_i
    end
    
    def isLoggedIn
        return false if getUserId == 0
        return true
    end
end
