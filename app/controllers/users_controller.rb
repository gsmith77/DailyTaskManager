class UsersController < ApplicationController

    def show
        @user = User.find_by(params[:id])
    end

    def new
        @user = User.new
    end

    def create
        binding.pry
        @user = User.find_by(params[:id])
        if @user.save
            redirect_to user_path(@user)
        else
            render new_user_path, alert: "Please fill out all forms"
        end


    end
end
