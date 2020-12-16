class AttachmentController < ApplicationController
    include UsersHelper
    DEFAULT_ICON_PATH = File.join(Rails.root, 'app', 'assets', 'images', 'default_icon.jpg')
    
    def new
        @attachment = Attachment.new(
            subject_time_id: params[:tid],
        )
    end
    
    def create
        d = params[:attachment]
        flash[:type] = 'error'
        flash[:message] = '権限がありません'
        flash[:stay] = true
        flash[:position] = 'top'
        flash[:time] = 5
        flash[:func] = 'force'
        
        if Subject.isTeacherOfThis(Subject.getIdFromTime(d[:subject_time_id]), getUserId) then
            
            @attachment = Attachment.new(
                subject_time_id: d[:subject_time_id],
                name: d[:name],
                file: d[:file].read,
                filetype: d[:file].content_type
            )
            
            @attachment.name = d[:file].original_filename if @attachment.name == ""
            
            r = SubjectTime.find(d[:subject_time_id]).attachment << @attachment
            
            if r
                flash[:message] = '保存しました'
                flash[:stay] = false
                flash[:position] = 'top'
                flash[:time] = 5
                flash[:func] = 'success'
            else
                flash[:message] = "保存できませんでした"
            end
            
        end
        
        redirect_to subject_path(Subject.getIdFromTime(d[:subject_time_id]))
    end
    
    def show
        f = Attachment.find_by(id: params[:id])

        if !f.nil? then
            sid = Subject.getIdFromTime(Attachment.find(params[:id]).subject_time_id)
            if CourseRegistration.isRegistered(sid, getUserId) || Subject.isTeacherOfThis(sid, getUserId) 
                return send_data f.file, disposition: :inline, type: f.filetype
            end
        end
        
        #return send_file File.join(DEFAULT_ICON_PATH), type: 'image/jpeg', disposition: 'inline'
    end
    
    def destroy
        sid = nil
        f = Attachment.find_by(id: params[:id])
        
        flash[:type] = 'error'
        flash[:message] = 'ファイルが見つかりません'
        flash[:stay] = true
        flash[:position] = 'top'
        flash[:time] = 5
        flash[:func] = 'force'
        
        if !f.nil? then
            sid = Subject.getIdFromTime(f.subject_time_id)
            
            if Subject.isTeacherOfThis(Subject.getIdFromTime(sid), getUserId) then
                flash[:message] = 'ファイルを削除しました'
                flash[:stay] = false
                flash[:func] = 'alert'
                flash[:type] = 'info'
                
                f.destroy
            else
                flash[:message] = '権限がありません'
            end
        end
        
        if !sid.nil?
            redirect_to subject_path(sid)
        else
            redirect_to subjects_path
        end
    end
end
