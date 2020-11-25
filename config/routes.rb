Rails.application.routes.draw do
  get 'users/new'
  root 'main#index'
  get 'subjects/index'
  get 'subject/index'
  get 'users/new', to: 'users#new'
  post 'users', to: 'users#create'
  get 'login', to: 'login#index'
  get 'login/login', to: 'login#index'
  post 'login/login'
  get 'login/logout'
end