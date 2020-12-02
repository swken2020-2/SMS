class User < ApplicationRecord
    validates :email,presence: true,uniqueness: :true
    validates :password, presence: true
    
    def self.authenticate(email,password)
        user = find_by(email: email)
        if user and BCrypt::Password.new(user.password) == password
            true
        else
            false
        end
    end
end
