class SubjectProfileController < ApplicationController
    def show
        id = params[:id]
        subject = Subject.find_by(id: id)
        @sp = nil
        if !subject.nil?
            @sp = subject.subject_profile
        end
    end
    
    def edit
    end
end
