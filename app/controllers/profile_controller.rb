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
            icon: icon,
            icontype: type,
            role: role
        )
        
        redirect_to edit_profile_path(@p.id)
    end
end
