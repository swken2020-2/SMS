class AttendController < ApplicationController
    def show
        id = params[:id]
        subject_time = Subject.find(id).subject_time
        @a = []
        p subject_time
        subject_time.each do |st|
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
