class ListsController < ApplicationController
before_action :authenticate_user

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
        @list = List.find(params[:id])
        @completed_tasks = @list.tasks.completed? 
        @incomplete_tasks = @list.tasks.incomplete?
    end
    
    def create
        if params[:list][:list_id].present?
            @list = List.find(params[:list][:list_id])
            current_user.lists << @list
        end
        if @list.nil?
            @list = current_user.lists.find_or_create_by(list_params)
            @list.user_id = current_user.id
            @list.save
            current_user.lists << @list
        end
        redirect_to user_list_path(current_user, @list)
    end

    def destroy
        current_user.empty_lists
        redirect_to user_path(current_user)
    end


    private

    def list_params 
        params.require(:list).permit(:id, :title, :user_id, tasks_attributes: [:content, :status])
    end

end
