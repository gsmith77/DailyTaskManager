require 'pry'
class UsersController < ApplicationController
    before_action :authenticate_user, only: [:show]
    
    def show
        @user = User.find(params[:id])
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(current_user)
        else
            render new_user_path
        end
    end


    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :bio, lists_attributes: [:title])
    end

end
