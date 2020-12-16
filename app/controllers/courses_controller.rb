class CoursesController < ApplicationController
    include UsersHelper
    
    def index
        @s = Subject.all
    end
    
    def create
        id = params[:id]
        sub = Subject.find(id)
        u = User.find(getUserId)
        # u.course_registrations << sub
        if !CourseRegistration.isRegistered(sub.id, getUserId)
            sub.course_registration_users << u
        end
        
        redirect_to courses_path
    end
    
    def destroy
        sub = Subject.find(params[:id])
        user = User.find(getUserId)
        sub.course_registration_users.destroy(user.id)
        
        redirect_to subjects_path
    end
end
