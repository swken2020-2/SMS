
Rails.application.routes.draw do
  get 'users/new'
  post 'users/create'
  root'main#index'
  get 'main/index'
  resources :subjects
  resources :courses, only: [:index, :create, :destroy]
  resources :attend, only: [:show, :edit, :update]
  get 'login', to: 'login#index'
  get 'login/login', to: 'login#index'
  post 'login/login'
  get 'login/logout'
end