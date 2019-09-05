class ListsController < ApplicationController
    before_action :authenticate_user
    
        def index
           if params[:user_id]
                @user_lists = User.find_by(id: params[:user_id]).lists.uniq
                respond_to do |f|
                    f.html 
                    f.json {render json: @user_lists}
                end
            else
                @lists = List.all
                respond_to do |f|
                    f.html 
                    f.json {render json: @lists}
                end
            end

        end
    
        def new
            @list = List.new
        end
    
        def show
            @list = List.find(params[:id])
            @completed_tasks = @list.tasks.completed? 
            @incomplete_tasks = @list.tasks.incomplete?
            respond_to do |f|
                f.html 
                f.json {render json: @list}
            end
        end
        
        def create
            #EMPTY TASK IS CREATED HERE! FIX IT!
            @list = current_user.lists.find_or_create_by(list_params)
            @list.user_id = current_user.id
            @list.save
            #adding to current users lists makes an empty task
            render json: @list
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
    