class AttendController < ApplicationController
    include AttendManagerHelper
    include UsersHelper
    
    def create
        flash[:type] = 'error'
        flash[:message] = 'unknown'
        flash[:stay] = true
        flash[:position] = 'top'
        flash[:time] = 5
        flash[:func] = 'force'
        
        sti = params[:subject_time_id]
        si = params[:subject_id]
        nowsti = AttendManager.find_by(subject_id: si)
        
        if sti.to_i != nowsti.subject_time_id.to_i
            flash[:message] = '不明なエラー'
        else
            
            if !CourseRegistration.isRegistered(si, getUserId)
                flash[:message] = 'この講義を履修していないようです'
            else
                if !isAvailable(si)
                    flash[:message] = '時間切れのようです'
                else
                    a = Attend.find_by(subject_time_id: nowsti.subject_time_id, user_id: getUserId)
                    a = Attend.new(
                        subject_id = si,
                        subject_time_id: nowsti.subject_time_id,
                        user_id: getUserId,
                        ip: nil
                    ) if a.nil?
                    
                    a.status = 1
                    a.ip = request.remote_ip
                    a.save
                    
                    flash[:type] = 'success'
                    flash[:message] = '出席の記録をしました'
                    flash[:stay] = false
                    #flash[:func] = 'alert'
                end
            end
        end
        
        redirect_to subject_path(si)
    end
    
    def show
        id = params[:id]
        subject_time = Subject.find(id).subject_time
        @a = []
        p subject_time
        subject_time.each do |st|
            all_member = CourseRegistration.where(subject_id: id).pluck(:user_id)
            now_member = Attend.where(subject_time_id: st.id).pluck(:user_id)
            
            diff = all_member - now_member
            diff.each do |d|
                a = Attend.new(
                    subject_time_id: st.id,
                    user_id: d,
                    status: 0
                )
                
                a.save
            end
            
            @a << {:time => Attend.where(subject_time_id: st), :title => st.title}
        end
    end
    
    def edit
    end
    
    def update
    end
    
    def check(subject_id)
        return Subject.isTeacherOfThis(subject_id, getUserId)
    end
end
