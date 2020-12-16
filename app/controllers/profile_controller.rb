class ProfileController < ApplicationController
    include UsersHelper
    
    def edit
        pi = params[:id]
        if !User.hasPermission2EditProfile(getUserId, pi) then
          redirect_to root_path
          return
        end
        
        @profile = User.find(pi).profile

    end
    
    def update
        u_id = params[:id]
        
        flash[:type] = 'error'
        flash[:message] = '権限がありません'
        flash[:stay] = true
        flash[:position] = 'top'
        flash[:time] = 5
        flash[:func] = 'force'
        
        if (u_id.to_i == getUserId.to_i || User.isAdmin(getUserId))
        
            @p = User.find(u_id).profile
            old_p = params[:profile]
            role = @p.role
            role = old_p[:role] if !old_p[:role].nil?
                
            icon = nil
            icon = @p.icon  if !@p.icon.nil?
            icon = old_p[:icon].read if !old_p[:icon].nil?
            
            type = nil 
            type = @p.icontype  if !@p.icontype.nil?
            type = old_p[:icon].content_type if !old_p[:icon].nil?
            
            update = @p.update(
                name: old_p[:name],
                number: old_p[:number],
                icon: icon,
                icontype: type,
                role: role
            )
            
            if update
                flash[:type] = 'info'
                flash[:message] = '変更しました'
                flash[:stay] = false
                flash[:time] = 5
                flash[:func] = 'alert'
            else
                flash[:message] = '不明なエラーです'
            end
            
        else
            
        end
        
        redirect_to edit_profile_path(u_id)
    end
end
