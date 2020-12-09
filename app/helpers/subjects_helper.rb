module SubjectsHelper
    def isTeacher
        id = getUserId
        t = User.find_by(id: id)
        return false if t.nil?
        
        return true if t.profile.role >= 1 # ユーザーのprofileのタイプが1以上なら教師
        return false
    end
    
    def getResponsibleSubjects
        a = SubjectProfile.all.where(teacher_id: getUserId).pluck(:subject_id)
        b = Subject.where("id IN (?)", a).pluck(:id)
        return b
    end
    
    def getNonResponsibleSubjects
        a = SubjectProfile.all.where.not(teacher_id: getUserId).pluck(:subject_id)
        b = Subject.where("id IN (?)", a).pluck(:id)
        return b
    end
    
end
