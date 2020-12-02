
Rails.application.routes.draw do
  get 'users/new'
  post 'users/create'
  root'main#index'
  get 'main/index'
  resources :subjects, only: [:index, :new, :create, :destroy]
  resources :courses, only: [:index, :create, :destroy]
  get 'login', to: 'login#index'
  get 'login/login', to: 'login#index'
  post 'login/login'
  get 'login/logout'
end