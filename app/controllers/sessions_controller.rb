class SessionsController < ApplicationController

    def new
        #rework it to be an email instead of a name and then make it a TEXT FIELD so the users can see all of the users
    end
    
    def create
        if auth.present?
            @user = User.find_or_create_by(uid: auth['uid']) do |u|
            u.password = SecureRandom.urlsafe_base64(n=6)
            u.name = auth['info']['name']
            u.email = auth['info']['email']
            u.image = auth['info']['image']
            end
            session[:user_id] = @user.id
     
            redirect_to user_path(@user)
        else
            @user = User.find_by(name: params[:user][:name])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        end
    end

    def destroy
        session.delete(:user_id)
        current_user = nil
        flash[:alert] = "You are now Logged Out Have a Nice Day!"
        redirect_to '/'
    end

    private 

    def auth
        request.env['omniauth.auth']
    end
end
