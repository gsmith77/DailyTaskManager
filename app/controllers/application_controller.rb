class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_user, :is_logged_in?, :authenticate_user, :redirect_if_logged_in

    def current_user
        if session[:user_id].present?
        User.find(session[:user_id])
        end
    end

    def is_logged_in?
        !current_user.nil?
    end

    def authenticate_user
        redirect_to '/' unless is_logged_in?
    end

    def redirect_if_logged_in
        redirect '/' if current_user
    end

end
