class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_user, :is_logged_in?
    
    def current_user
        User.find(session[:user_id])
    end

    def is_logged_in?
        !current_user.nil?
    end

end
