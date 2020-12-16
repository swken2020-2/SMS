module AttendManagerHelper
    def isAvailable(subject_id)
        sbj = Subject.find(subject_id)
        am = AttendManager.find_by(subject_id: sbj.id)
        return false if am.nil?
        expired = am.expired.to_i
        now = Time.now.to_i
        return true if (expired - now) >= 0
        return false
    end
    
    def isAvailableByUser(subject_id, user_id)
        sti = getAvailableTime(subject_id)
        return false if sti.nil?
        a = Attend.find_by(subject_time_id: sti.subject_time_id, user_id: user_id)
        return true if a.nil?
        return true if a.status == 0
        return false
    end
    
    def isAvailableTimeId(time_id)
        #nowid = 
    end
    
    def getAvailableTime(subject_id)
        at = AttendManager.find_by(subject_id: subject_id)
        #st = SubjectTime.find_by(subject_id: subject_id)
        return nil if !isAvailable(subject_id)
        return at
    end
    
    def getAvailableTimeId(subject_id)
        at = getAvailableTime(subject_id)
        return nil if at.nil?
        return at.subject_time_id
    end
    
    def getTitleFromTimeId(time_id)
        return SubjectTime.find(time_id).title
    end
end
