class ListsController < ApplicationController

    def index
        #display lists by their created_at dates for the User to pick
        if params[:user_id]
            @lists = User.find_by(id: params[:user_id]).lists
        else
            @lists = List.all
        end
    end

    def new
        @list = List.new
    end

    def show
        @list = List.find_by(params[:id])
    end
    
    def create
        @list = List.find_by(params[:id])
        redirect_to user_list_path(current_user, @list)
    end

    def update
        @list = List.find_by(params[:id])
        if params[:list][:list][:content] 
            redirect_to #task create path
        else
            redirect_to user_list_path(current_user, @list) 
        end
    end

    private

    def list_params
        params.require(:list).permit(:title)
    end

end
