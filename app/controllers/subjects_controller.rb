class SubjectsController < ApplicationController
  include UsersHelper
  include SubjectsHelper
  
  def index
    @subjects = User.find(getUserId).course_registrations.pluck(:subject_id)
  end
  
  def new
    @s = SubjectProfile.new
  end
  
  def create
    if isTeacher then
      name = params[:subject_profile][:name]
      pr = params[:subject_profile]
      des = params[:subject_profile][:description]
      
      image = nil
      image = pr[:image].read if !pr[:image].nil?
      
      type = nil
      type = pr[:image].content_type if !pr[:image].nil?
      
      
      s = Subject.new(
        
      )
      
      @sp = SubjectProfile.new(
        teacher_id: getUserId,
        name: name,
        image: image,
        icontype: type,
        description: des
      )
      
      s.subject_profile = @sp
      s.save
    end
    
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
