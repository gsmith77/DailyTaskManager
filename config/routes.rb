Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

resources :users do
  resources :lists, only: [:index, :new, :show, :create]
end

resources :lists do
  resources :tasks, only: [:index, :new, :create, :show]
end



end
