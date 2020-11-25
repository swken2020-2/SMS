module SubjectsHelper
    def isTeacher(id)
        return true if id == -1 #あとで削除
        return false if id == -2 #あとで削除
        t = User.find_by(id: id)
        return false if t.nil?
        
        return true if t.profile.type >= 1 # ユーザーのprofileのタイプが1以上なら教師
        return false
    end
    
end
