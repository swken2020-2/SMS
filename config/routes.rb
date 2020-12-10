
Rails.application.routes.draw do
  get 'main/login_form'
  
  get 'main/index'
  
  resources :subjects
  resources :courses, only: [:index, :create, :destroy]
  resources :attend, only: [:show, :edit, :update]
  resources :users, only: [:new, :create, :edit, :update, :show]
  resources :profile, only: [:edit, :update]
  
  root'login#index'
  get 'login', to: 'login#index'
  get 'login/login', to: 'login#index'
  post 'login/login'
  get 'login/logout'
  
  get 'image/user'
  get 'image/subject'
end