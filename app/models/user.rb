class User < ApplicationRecord
    has_secure_password
    has_many :lists
    has_many :lists, through: :tasks
    helper_method :current_user


    def current_user
        session[:user_id]
    end
end
