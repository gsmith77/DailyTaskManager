class ListsController < ApplicationController

    def index
        if params[:user_id]
            @lists = User.find(id: params[:user_id]).lists
        else
            @lists = List.all
        end
    end

    def new
        @list = List.new
    end

    def show
        #need to grab a single list
        binding.pry
        @list = List.find_by(params[:id])
    end
    
    def create
        @list = List.find_by(params[:id])
        redirect_to user_list_path(current_user, @list.id)
    end

    private

    def list_params
        params.require(:list).permit(:title)
    end

end
