class User < ApplicationRecord
    include ActionView::Helpers
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
    
    def self.getUserFromId(i)
        return nil if !self.isInt(i)
        u = User.find(i)
        return u
    end
    
    def self.hasPermission2EditProfile(u, i)
        return false if !self.isInt(i)
        i = i.to_i
        id = u.to_i
        
        return false if id.nil?

        if self.isStudent(id)
            if i == id
                return true
            end
            return false
        end
        
        if self.isTeacher(id)
            return true
        end
        
        if self.isAdmin(id)
            return true
        end
        return false
    end
    
    #####
    
    def self.isStudent(i)
        return false if !self.isInt(i)
        role = Profile.getRole(i)
        return false if role != 0
        return true
    end
    
    def self.isTeacher(i)
        return false if !self.isInt(i)
        role = Profile.getRole(i)
        return false if role != 1
        return true
    end
    
    def self.isAdmin(i)
        p "they are an admin #{self.isInt(i)}"
        return false if !self.isInt(i)
        role = Profile.getRole(i)
        return false if role != 2
        return true
    end
    
    def self.isInt(i)
        i = i.to_s
        if i =~ /^[0-9]+$/ then
            return true
        end
        return false
    end
end
