class User < ApplicationRecord
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true
    
    has_one :profile
    
    def self.authenticate(email,password)
        user = find_by(email: email)
        return false if user.nil?
        if BCrypt::Password.new(user.password) == password
            true
        else
            false
        end
    end
end
