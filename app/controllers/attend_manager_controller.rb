class AttendManagerController < ApplicationController
    include UsersHelper
    include SubjectsHelper
    
    def create
        subject_id = params[:id]
        time_id = params[:time]
        userid = getUserId
        
        if Subject.isTeacherOfThis(subject_id, userid) then
            a = SubjectTime.find(time_id)
            a.check = true
            a.save
            
            am = AttendManager.find_by(subject_id: subject_id)
            am = AttendManager.new(
                subject_id: subject_id,
                subject_time_id: time_id
            ) if am.nil?
            
            am.subject_time_id = time_id
            t = Time.now
            am.expired = t.since(30.minutes)
            
            am.save
        else
            
        end
        
        redirect_to subject_path(subject_id)
    end
    
    def destroy
        subject_id = params[:id]
        time_id = params[:time]
        userid = getUserId
        
        if Subject.isTeacherOfThis(subject_id, userid) then
            am = AttendManager.find_by(subject_id: subject_id)
            am = AttendManager.new(
                subject_id: subject_id,
                subject_time_id: time_id
            ) if am.nil?
            
            am.expired = 0
            
            am.save
        else
            
        end
        
        redirect_to subject_path(subject_id)        
    end
end
