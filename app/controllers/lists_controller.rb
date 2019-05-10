class ListsController < ApplicationController

    def index
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
        @list = List.find(params[:id])
        @completed_tasks = @list.tasks.completed? 
        @incomplete_tasks = @list.tasks.incomplete?
    end
    
    def create
        binding.pry
        @list = List.find_or_create_by(list_params)
        @list.user = current_user
        @list.save
        current_user.lists << @list
        redirect_to user_list_path(current_user, @list)
    end

    def update
        @list = List.find(params[:id])
        if params[:list][:tasks_attributes].present?
            redirect_to list_create_task_path(@list)
        else
            render user_list_path(current_user, @list) 
        end
    end


    private

    def list_params
        params.require(:list).permit(:title, :user_id, tasks_attributes: [:content, :status])
    end

end
