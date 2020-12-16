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
    
    flash[:type] = 'error'
    flash[:message] = 'unknown'
    flash[:stay] = true
    flash[:position] = 'top'
    flash[:time] = 5
    flash[:func] = 'force'
    
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
      
      @sp.subject = s
      
      if @sp.save then
        flash[:type] = 'success'
        flash[:message] = "クラス「#{@sp.name}」を作成しました"
        flash[:stay] = false
        flash[:func] = 'alert'
      else
        flash[:message] = "クラス「#{@sp.name}」を作成できませんでした"
      end
    else
      flash[:message] = '権限がありません'
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
