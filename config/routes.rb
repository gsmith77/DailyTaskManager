Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'users#new'

resources :users do
  resources :lists, only: [:index, :new, :show, :create]
end
resources :lists
post 'lists/create', to: 'lists#create', as:'create_list'
resources :lists do
  resources :tasks, only: [:index, :new]
  patch "/tasks/update", to: "tasks#update", as: "update_task"
  post '/tasks/create', to: 'tasks#create', as: 'create_task'
end
resources :tasks
post'signin', to: "sessions#create"
get 'signin', to: "sessions#new"
get '/logout', to: 'sessions#destroy', as: "logout"

get '/auth/facebook/callback' => 'sessions#create'
post '/lists/completed', to: 'lists#completed', as: "tasks_completed"
post '/lists/incomplete', to: 'lists#incomplete', as: "tasks_incomplete"
post '/lists/all_tasks', to: 'lists#all_tasks', as: "tasks_all_tasks"



end
