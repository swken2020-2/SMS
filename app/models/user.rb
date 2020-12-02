class User < ApplicationRecord
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true
    
    has_one :profile
    
    def self.authenticate(email, pass)
        user = find_by(email: email)
        return false if user.nil?
        p "#{BCrypt::Password.new(user.password) == pass}"
        if (BCrypt::Password.new(user.password) == pass) then
            return true
        else
            return false
        end
    end
end
