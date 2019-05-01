class ListsController < ApplicationController

    def index
        @lists = List.all
    end

    def new
        @list = List.new
    end

    def show
        @list = List.find_by(params[:id])
    end

    def create
        @list = List.new(list_params)
        if @list.save
            redirect_to list_path(@list)
        else
            render 'new'
        end
    end

    private

    def list_params
        params.require(:list).permit(:title)
    end

end
