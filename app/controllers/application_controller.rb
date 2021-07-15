class ApplicationController < ActionController::Base
    helper_method :current_user   

    private 

    def current_user
        @user = User.find_by(id: sessions[:user_id]) 
    end

end


