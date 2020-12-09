
Rails.application.routes.draw do
  get 'main/login_form'
  get 'users/new'
  post 'users/create'
  get 'main/index'
  resources :subjects
  resources :courses, only: [:index, :create, :destroy]
  resources :attend, only: [:show, :edit, :update]
  root'login#index'
  get 'login', to: 'login#index'
  get 'login/login', to: 'login#index'
  post 'login/login'
  get 'login/logout'
  
end