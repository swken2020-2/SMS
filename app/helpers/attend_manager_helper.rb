module AttendManagerHelper
    def isAvailable(subject_id)
        sbj = Subject.find(subject_id)
        am = AttendManager.find_by(subject_id: sbj.id)
        expired = am.expired.to_i
        now = Time.now.to_i
        return true if (expired - now) >= 0
        return false
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
