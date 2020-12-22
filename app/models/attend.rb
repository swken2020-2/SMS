class Attend < ApplicationRecord
    def self.isAttend(subject_time_id, user_id)
        st = SubjectTime.find(subject_time_id)
        s = Subject.find(st.subject_id)
        flg = CourseRegistration.isRegistered(s.id, user_id)
        # まず履修登録しているかどうか
        return nil if !flg
        
        t = Attend.find_by(subject_time_id: subject_time_id, user_id: user_id)
        
        if t.nil? then
            t = Attend.new(
                subject_time_id: subject_time_id,
                user_id: user_id,
                status: 0
            )
            
            t.save
        end
        
        return true if t.status == 1
        return false
    end
    
    def self.getStatus(subject_time_id, user_id)
        return nil if !CourseRegistration.isRegisteredFromTime(subject_time_id, user_id)
        self.isAttend(subject_time_id, user_id)
        st = Attend.find_by(subject_time_id: subject_time_id, user_id: user_id)
        
        
        return self.status2str(st.status)
    end
    
    def self.status2str(status = -1)
        return -1 if status < 0
        case status
            when 0 then
                return ""
            when 1 then
                return "出席"
            when 2 then
                return "欠席"
            when 3 then
                return "遅刻"
            when 4 then
                return "早退"
            when 5 then
                return "公欠"
            else
                return "-over"
        end
    end
end
