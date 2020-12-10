module UsersHelper
    def getUserId
        return nil if session[:login_uid].nil?
        return session[:login_uid].to_i
    end
end
