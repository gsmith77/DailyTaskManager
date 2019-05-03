class TasksController < ApplicationController

    def index
    end

    def show
    end
    
    def new
        @task = Task.new
    end

    def create
        @task = Task.new(task_params)
        if @task.save
            redirect_to list_tasks_path(List.find_by(param[:list_id]))
        else
            render user_path(User.find_by(params[:user_id]))
        end
    end

    private

    def task_params
        params.require(:task).permit(:list_id, :content)
    end
end