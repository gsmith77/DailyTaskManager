class SessionsController < ApplicationController

    #update routes
    #create login
    #create logout which is destroy session [:user_id]

    def new
    end

    def create
        binding.pry
        @user = User.find_by(name: params[:user][:name])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

    def destroy
        session.delete :name
      end
end
