class TasksController < ApplicationController
 before_action :authenticate_user
 
    def index
        if params[:list_id]
            @list = List.find(params[:list_id])
            @incomplete_tasks = @list.tasks.incomplete? 
            @tasks = @list.tasks
            respond_to do |f|
                f.html 
                f.json {render json: @list && @incomplete_tasks && @tasks}
            end
            list_tasks_path(@list)
        else
            @tasks = Task.all
            respond_to do |f|
                f.html 
                f.json {render json: @tasks}
            end
            tasks_path
        end
    end

    def show
        #One Resource to Show with JSON
        @task = Task.find(params[:id])
        @list = List.find(@task.list_id)
        respond_to do |f|
            f.html {list_tasks_path(@list, @task)}
            f.json {render json: @task}
        end
    end
    
    def new
        @task = Task.new
        @list = List.find(params[:list_id])
    end

    def create
        if task_params[:content].present?
            #assign task with list id and current_user id try a f.hidden_field
            @list = List.find(task_params[:list_id]) if task_params[:list_id]
            @list = List.find(params[:list_id]) if params[:list_id]
            if @list.user_id == current_user.id
                @task = @list.tasks.create({content: task_params[:content], list_id: @list.id,  user_id: current_user.id})
                render json: @task

            else
                redirect_to user_path(current_user)
            end
        else
            @list = List.find(params[:list_id])
            flash[:alert] = "Content can not be blank."
            redirect_to new_list_task_path(@list)
        end
    end

    def update
        @task = Task.find(params[:id])
        @list = List.find(@task.list_id)
        if @list.user_id == current_user.id && @task.update(task_params)
            @list.tasks << @task
            redirect_to list_tasks_path(@list)
        else
            flash[:alert] = "You are not the Owner of the List. Therefore You are not permitted to edit the Tasks of this List."
            redirect_to user_list_path(current_user, @list)
        end
    end

    private

    def task_params
        params.require(:task).permit(:list_id, :user_id, :content, :status)
    end
end