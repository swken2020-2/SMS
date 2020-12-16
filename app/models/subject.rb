class Subject < ApplicationRecord
    has_one :subject_profile, dependent: :destroy
    has_many :course_registrations
    has_many :course_registration_users, through: :course_registrations, source: :user
    
    has_many :subject_time
    
    def self.isTeacherOfThis(subject_id, user_id = -1)
        user_id = getUserId if user_id == -1
        s = Subject.find(subject_id)
        u = User.find(user_id)
        
        return true if u.profile.role == 2
        return true if s.subject_profile.teacher_id == u.id
        return false
    end
    
    def self.getIdFromTime(subject_time_id)
        return SubjectTime.find(subject_time_id).subject_id
    end
end

# コース.course_registration_users << ユーザー