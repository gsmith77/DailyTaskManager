require 'pry'
class UsersController < ApplicationController
    before_action :authenticate_user, only: [:show]
    
    def show
        #has_many json display User -> has_many -> lists
        @user = User.find(params[:id])
        respond_to do |f|
            f.html {user_path(current_user)}
            f.json {render json: @user}
        end
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
