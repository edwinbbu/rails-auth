Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:create, :index]
  resources :tasks, only: [:create, :index]
  resources :sessions, only: [:create, :destroy]
end
