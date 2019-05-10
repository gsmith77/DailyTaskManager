class ListsController < ApplicationController

    def index
        if params[:user_id]
            @user_lists = User.find_by(id: params[:user_id]).lists
        else
            @lists = List.all
        end
    end

    def new
        @list = List.new
    end

    def show
        is_logged_in?
        @list = current_user.lists.find(params[:id])
        @completed_tasks = @list.tasks.completed? 
        @incomplete_tasks = @list.tasks.incomplete?
    end
    
    def create
        is_logged_in?
        @list = List.find_or_create_by(list_params)
        @list.user_id = current_user.id
        @list.save
        current_user.lists << @list
        redirect_to user_list_path(current_user, @list)
    end

    def update
        is_logged_in?
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
