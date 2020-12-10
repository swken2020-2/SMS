class Profile < ApplicationRecord
    belongs_to :user
    
    def self.getRole(i)
        u = User.getUserFromId(i)
        p u
        return false if u.nil?
        p "役割: #{u.profile.role}"
        return u.profile.role
    end
end