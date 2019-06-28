class ListsController < ApplicationController
before_action :authenticate_user

    def index
        if params[:user_id]
            @user_lists = User.find_by(id: params[:user_id]).lists
        else
            @lists = List.all
        end
        respond_to do |f|
            f.html 
            f.json {render json: @user_lists || @lists}
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
        @list = current_user.lists.find_or_create_by(list_params)
        @list.user_id = current_user.id
        @list.save
        current_user.lists << @list
        respond_to do |f|
            f.html 
            f.json {render json: @list, status: 201}
        end
        redirect_to user_path(current_user)
    end

    def destroy
        if params[:id].present?
            @list = List.find(params[:id])
            @list.delete
            redirect_to user_path(current_user)
        end
    end


    private

    def list_params 
        params.require(:list).permit(:id, :title, :user_id, tasks_attributes: [:content, :status])
    end

end
