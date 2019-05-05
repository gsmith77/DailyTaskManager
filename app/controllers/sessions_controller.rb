class SessionsController < ApplicationController

    #update routes
    #create login
    #create logout which is destroy session [:user_id]
    def create
        session[:name] = params[:name]
        redirect_to '/'
    end

    def destroy
        session.delete :name
      end
end
