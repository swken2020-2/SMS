class CoursesController < ApplicationController
    def index
        @s = Subject.all
    end
    
    def create
        id = params[:id]
        redirect_to courses_path
    end
    
    def destroy
    end
end
