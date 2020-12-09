class SubjectsController < ApplicationController
  include UsersHelper
  include SubjectsHelper
  
  def index
    @subjects = User.find(getUserId).course_registrations.pluck(:subject_id)
  end
  
  def new
    @s = Subject.new
  end
  
  def create
    name = params[:subject][:name]
    @s = Subject.new(
      name: name
    )
    
    sp = SubjectProfile.new(
      teacher_id: getUserId
    )
    
    @s.subject_profile = sp
    @s.save
    
    redirect_to subjects_path
  end
  
  def show
    id = params[:id]
    @subject = Subject.find_by(id: id)
    
    @times = @subject.subject_time
  end
  
  def destroy
    
  end
end
