class User < ApplicationRecord
    validates :email, presence: true, uniqueness: true
    validates :email,format:{with: /\A[\w+\-]+@[a-z\d\-.]+\.[a-z]+\z/i}
    validates :password, presence: true
    validates :password, length: { minimum: 8 }
    has_one :profile
    
    #has_many :subject_profiles
    
    # 履修
    has_many :course_registrations
    has_many :course_registration_subjects, through: :course_registrations, source: :subject
    
    def self.authenticate(email, pass)
        user = find_by(email: email)
        return false if user.nil?
        if (BCrypt::Password.new(user.password) == pass) then
            return true
        else
            return false
        end
    end
end
