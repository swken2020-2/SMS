class ImageController < ApplicationController
    DEFAULT_ICON_PATH = File.join(Rails.root, 'app', 'assets', 'images', 'default_icon.jpg')
    
    def user
        u = User.find_by(id: params[:id])
        if !u.nil? then
            p = u.profile.icon
        
            if !p.nil? then
                return send_data p, disposition: :inline, type: u.profile.icontype
            end
        end
        
        return send_file File.join(DEFAULT_ICON_PATH), type: 'image/jpeg', disposition: 'inline'
    end
    
    def subject
    end
end
