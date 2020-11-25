class SubjectsController < ApplicationController
  def index
    
  end
  
  def new
    @s = Subject.new
  end
  
  def create
    name = params[:subject][:name]
    @s = Subject.new(
      name: name
    )
    
    @s.save
    
    redirect_to subjects_path
  end
  
  def destroy
    
  end
end
