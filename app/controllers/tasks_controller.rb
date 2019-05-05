class TasksController < ApplicationController

    def index
        if params[:list_id]
            @tasks = current_list.tasks
            list_tasks_path(current_list)
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
        @list = List.find_by(params[:list_id])
        @tasks = @list.tasks.create({content: task_params[:content], list_id: @list.id,  user_id: @list.users[0].id})
        redirect_to list_tasks_path(@list)
    end

    def update
        @task = Task.find_by(params[:id])
        if @task.update(content: task_params[:content], status: task_params[:status], list_id: List.find_by(params[:id]).id, user_id: current_user.id)
            redirect_to list_tasks_path(List.find_by(params[:id]))
        else
            render task_path(@task)
        end
    end

    private

    def task_params
        params.require(:task).permit(:list_id, :user_id, :content, :status)
    end
end