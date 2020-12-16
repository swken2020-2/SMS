
Rails.application.routes.draw do
  get 'main/login_form'
  
  get 'main/index'
  
  resources :subjects
  resources :courses, only: [:index, :create, :destroy]
  resources :attend, only: [:create, :show, :edit, :update]
  resources :users, only: [:new, :create, :edit, :update, :show]
  get 'users', to: 'users#new' # リロード対策
  resources :profile, only: [:edit, :update]
  resources :subject_profile, only: [:show, :edit, :update]
  resources :subject_settings, only: [:show, :edit, :update]
  resources :subject_time, only: [:new, :create, :edit, :update]
  resources :attend_manager, only: [:create, :destroy]
  resources :settings, only: [:index]
  resources :attachment, only: [:show, :new, :create, :destroy]
  
  root'login#index'
  get 'login', to: 'login#index'
  get 'login/login', to: 'login#index'
  post 'login/login'
  get 'login/logout'
  
  get 'image/user'
  get 'image/subject'
end