class SubjectTimeController < ApplicationController
    include UsersHelper
    
    def new
        @t = SubjectTime.new
    end
    
    def create
        pr = params[:subject_time]
        @t = SubjectTime.new(
            subject_id: pr[:subject_id],
            title: pr[:title],
            public: pr[:public]
        )
        
        if Subject.isTeacherOfThis(pr[:subject_id], userid) then
            
            s = Subject.find_by(id: pr[:subject_id]).subject_time
            s << @t
            
            all_member = CourseRegistration.where(subject_id: pr[:subject_id]).pluck(:user_id)
            
            all_member.each do |users|
                a = Attend.new(
                    subject_time_id: @t.id,
                    user_id: users,
                    status: 0
                )
                
                a.save
            end
        end
        
        redirect_to subject_path(pr[:subject_id])
    end
    
    def edit
        
    end
    
    def update
        
    end
end
