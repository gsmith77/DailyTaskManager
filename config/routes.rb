Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

resources :users do
  resources :lists, only: [:index, :new, :show, :create]
end

resources :lists do
  resources :tasks, only: [:index, :new]
  patch "/tasks/update", to: "tasks#update", as: "update_task"
  post '/tasks/create', to: 'tasks#create', as: 'create_task'
end
resources :tasks



end
