class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_user, :current_list
    def current_user
        User.find(session[:user_id])
    end

    def current_list
        List.find_by(params[:list_id])
    end
end
