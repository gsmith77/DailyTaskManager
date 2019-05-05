class TasksController < ApplicationController

    def index
        if params[:list_id]
            @list = List.find(params[:list_id])
            @tasks = @list.tasks
            list_tasks_path(@list)
        else
            @tasks = Task.all
            tasks_path
        end
    end

    def show
        @task = Task.find_by(params[:id])
    end
    
    def new
        @task = Task.new
    end

    def create
        if task_params[:content].present?
            @list = List.find_by(title: params[:title])
            @tasks = @list.tasks.create({content: task_params[:content], list_id: @list.id,  user_id: @list.users[0].id})
            redirect_to list_tasks_path(@list)
        else
            @list = List.find(params[:list_id])
            flash[:alert] = "Content can not be blank."
            redirect_to new_list_task_path(@list)
        end
    end

    def update
        @task = Task.find(params[:id])
        if @task.update(content: task_params[:content], status: task_params[:status], list_id: List.find(params[:id]).id, user_id: current_user.id)
            redirect_to list_tasks_path(List.find(params[:id]))
        else
            render task_path(@task)
        end
    end

    private

    def task_params
        params.require(:task).permit(:list_id, :user_id, :content, :status)
    end
end