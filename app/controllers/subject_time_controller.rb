class SubjectTimeController < ApplicationController
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
        
        s = Subject.find_by(id: pr[:subject_id]).subject_time
        s << @t
        redirect_to subject_path(pr[:subject_id])
    end
    
    def edit
        
    end
    
    def update
        
    end
end
