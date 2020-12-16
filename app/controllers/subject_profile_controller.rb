class SubjectProfileController < ApplicationController
    include UsersHelper
    
    def show
        id = params[:id]
        subject = Subject.find_by(id: id)
        @sp = nil
        if !subject.nil?
            @sp = subject.subject_profile
        end
    end
    
    def edit
        @s = SubjectProfile.find(params[:id])
    end
    
    def update
        id = params[:subject_profile][:id]
        @s = params[:subject_profile]
        
        flash[:type] = 'error'
        flash[:message] = 'unknown'
        flash[:stay] = true
        flash[:position] = 'top'
        flash[:time] = 5
        flash[:func] = 'force'
        
        sp2 = SubjectProfile.find_by(id: id)
        if sp2.nil?
            flash[:message] = '見つかりませんでした'
        else
            #teacher_id = sp2.teacher_id
            if !Subject.isTeacherOfThis(sp2.subject_id, getUserId)
                flash[:message] = '権限がありません'
            else
                new_sp = SubjectProfile.find_by(id: id)
                new_sp.name = @s[:name]
                new_sp.description = @s[:description]
                new_sp.image = @s[:image].read if !@s[:image].nil?
                new_sp.icontype = @s[:image].content_type if !@s[:image].nil?
                
                r = new_sp.save
                
                if (r)
                    flash[:message] = '保存しました'
                    flash[:type] = 'success'
                    flash[:stay] = false
                    flash[:func] = 'alert'
                else
                    flash[:message] = ''
                    flash[:func] = 'alert'
                    if new_sp.errors.present?
                        new_sp.errors.full_messages.each do |msg|
                            flash[:message] = "#{flash[:message]}#{msg}"
                        end
                    end
                    
                    @s = new_sp
                    render 'edit'
                    return
                end
                
            end
        end
        
        redirect_to subject_path(sp2.subject_id)
    end
end
