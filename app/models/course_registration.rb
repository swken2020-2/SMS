class CourseRegistration < ApplicationRecord
    belongs_to :user
    belongs_to :subject
    
    def self.isRegistered(subject_id, user_id)
        subject_id = subject_id.to_i
        subjects = User.find(user_id).course_registrations.pluck(:subject_id)
        return true if subjects.include?(subject_id)
        return false
    end
    
    def self.isRegisteredFromTime(subject_time_id, user_id)
        st = SubjectTime.find(subject_time_id)
        s = Subject.find(st.subject_id)
        flg = self.isRegistered(s.id, user_id)
        return flg
    end
    
    def self.getAllRegisteredUser(subject_id)
        
    end
end
